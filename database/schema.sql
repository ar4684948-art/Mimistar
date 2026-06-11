-- USERS TABLE (Artists + Admin)
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  full_name VARCHAR(255),
  role VARCHAR(50) DEFAULT 'artist', -- 'artist' or 'admin'
  profile_image_url VARCHAR(255),
  bio TEXT,
  bank_account VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- SONGS TABLE
CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  artist_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  duration INTEGER, -- in seconds
  genre VARCHAR(100),
  file_url VARCHAR(255) NOT NULL,
  cover_image_url VARCHAR(255),
  status VARCHAR(50) DEFAULT 'pending', -- 'pending', 'approved', 'rejected', 'published'
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- STREAMS TABLE (track plays)
CREATE TABLE streams (
  id SERIAL PRIMARY KEY,
  song_id INTEGER NOT NULL REFERENCES songs(id) ON DELETE CASCADE,
  listener_id VARCHAR(255), -- anonymous or user ID
  stream_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  duration_listened INTEGER -- in seconds
);

-- EARNINGS TABLE (30/70 split calculation)
CREATE TABLE earnings (
  id SERIAL PRIMARY KEY,
  artist_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  song_id INTEGER NOT NULL REFERENCES songs(id) ON DELETE CASCADE,
  streams_count INTEGER DEFAULT 0,
  total_revenue DECIMAL(10, 2) DEFAULT 0.00, -- from streaming
  artist_share DECIMAL(10, 2) DEFAULT 0.00, -- 30%
  admin_share DECIMAL(10, 2) DEFAULT 0.00, -- 70%
  period_start DATE,
  period_end DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PAYMENTS TABLE
CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  artist_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  amount DECIMAL(10, 2) NOT NULL,
  status VARCHAR(50) DEFAULT 'pending', -- 'pending', 'completed', 'failed'
  stripe_payment_id VARCHAR(255),
  payment_date TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- INDEXES (for performance)
CREATE INDEX idx_songs_artist_id ON songs(artist_id);
CREATE INDEX idx_streams_song_id ON streams(song_id);
CREATE INDEX idx_earnings_artist_id ON earnings(artist_id);
CREATE INDEX idx_payments_artist_id ON payments(artist_id);
