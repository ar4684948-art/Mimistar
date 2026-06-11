# 🎵 Mimistar Distribution Platform

**Music Distribution Platform** - Artists sambaza muziki zao wenyewe na kupata **30%** ya mapato.

## 📋 Mwongozo wa Haraka

### Features
- ✅ Artists kuupload muziki
- ✅ Track streams na analytics
- ✅ Automatic 30/70 revenue split
- ✅ Payment processing (Stripe)
- ✅ Admin dashboard
- ✅ Real-time earnings tracking

### Tech Stack
- **Backend:** Node.js + Express
- **Database:** PostgreSQL
- **Frontend:** React (coming soon)
- **Payment:** Stripe
- **Authentication:** JWT

## 🚀 Getting Started

### Prerequisites
```bash
Node.js v16+
PostgreSQL v12+
npm or yarn
```

### Installation

1. **Clone repository**
```bash
git clone https://github.com/ar4684948-art/Mimistar.git
cd Mimistar
```

2. **Install dependencies**
```bash
npm install
```

3. **Setup database**
```bash
createdb mimistar_db
psql mimistar_db < database/schema.sql
```

4. **Create .env file**
```bash
cp .env.example .env
# Edit .env na jaza credentials
```

5. **Start server**
```bash
npm run dev
```

Server itakuwa running at `http://localhost:5000`

## 📁 Project Structure

```
Mimistar/
├── config/           # Configuration files
├── database/         # SQL schemas
├── routes/           # API routes (coming soon)
├── models/           # Database models (coming soon)
├── middleware/       # Auth, validation (coming soon)
├── controllers/      # Business logic (coming soon)
├── package.json
├── server.js
└── README.md
```

## 🔗 API Endpoints (Coming Soon)

### Auth
- `POST /api/auth/register` - Register artist
- `POST /api/auth/login` - Login
- `POST /api/auth/logout` - Logout

### Artists
- `GET /api/artists/:id` - Get artist profile
- `PUT /api/artists/:id` - Update profile

### Songs
- `POST /api/songs/upload` - Upload song
- `GET /api/songs/:id` - Get song details
- `GET /api/artists/:id/songs` - Get artist's songs

### Analytics
- `GET /api/earnings/:artist_id` - Get earnings
- `GET /api/streams/:song_id` - Get stream stats

### Payments
- `GET /api/payments/:artist_id` - Payment history
- `POST /api/payments/withdraw` - Request withdrawal

## 💰 Revenue Model

```
100% streaming revenue from platforms
├── Artist (30%) → Bank account
└── Admin (70%) → Platform
```

## 📝 License

MIT License - See LICENSE file

## 📧 Contact

Email: support@mimistar.com

---

**Made with ❤️ for African Artists**
