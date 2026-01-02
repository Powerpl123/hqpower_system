# HQ Power System - Fleet & Report Management Platform

A comprehensive management system for tracking fleet maintenance, departmental operations, and organizational reports. Built with React, TypeScript, Supabase, and Tailwind CSS.

## 🎯 System Overview

HQ Power System is an enterprise-level platform designed to manage:
- **Fleet Management**: Track vehicles, maintenance schedules, and operational status
- **Department Operations**: Manage departments, team members, and access controls
- **Reporting System**: Create, review, and manage various organizational reports
- **User Management**: Role-based access control with hierarchical permissions
- **Notifications**: Real-time alerts and updates for critical events

## 🏗️ Architecture

### Frontend
- **Framework**: React 18+ with Vite
- **Language**: TypeScript
- **Styling**: Tailwind CSS with custom components
- **UI Library**: Shadcn/ui (Radix UI components)
- **State Management**: React Query (TanStack Query)
- **Routing**: React Router v6
- **Forms**: React Hook Form with Zod validation

### Backend
- **Database**: Supabase (PostgreSQL)
- **Authentication**: Supabase Auth
- **Real-time**: Supabase Realtime subscriptions
- **Functions**: Supabase Edge Functions

## 📊 Database Schema

### Core Tables

**Users & Authentication**
- `profiles`: User information (name, email, avatar, phone)
- `user_roles`: Role assignments (staff, supervisor, manager, director, admin)
- `user_department_access`: Department access permissions

**Departments & Organization**
- `departments`: Organizational departments with codes and descriptions
- `team_members`: Department team member assignments

**Fleet Management**
- `fleets`: Vehicle records with status (operational, under_maintenance, out_of_service)
- `fleet_issues`: Issues/problems associated with fleet vehicles
- `maintenance_records`: Maintenance history and schedules
  - Tracks: maintenance_date, next_service_due, service_type (preventive/corrective/breakdown)
  - Status: current, upcoming, and completed services

**Reporting System**
- `reports`: Organizational reports with status tracking
  - Types: incident, financial, performance, general
  - Status: draft, pending, in_review, approved, rejected, escalated
  - Priority: low, medium, high, critical

**Notifications**
- `notifications`: User alerts and updates

### Role Hierarchy
- **Admin**: Full system access
- **Director**: Department and organizational oversight
- **Manager**: Team and report management
- **Supervisor**: Team supervision and monitoring
- **Staff**: Basic access and report submission

## 🎨 Key Features

### Dashboard
- Welcome greeting with user's first name
- KPI Cards displaying:
  - Total Reports
  - Approved Reports
  - Pending Reviews
  - Escalated Issues
- Recent Reports overview
- Department access cards
- Real-time data updates

### Fleet Management
- **Fleet Overview Table**: All vehicles with status, condition, and operator info
- **KPI Cards**: Total fleet count, operational status, maintenance statistics
- **Current Maintenance**: Active maintenance records
- **Upcoming Services**: Scheduled preventive maintenance
- **Recent Activity**: Recent fleet-related events
- **Add Fleet Dialog**: Create new vehicle records
- **Add Maintenance Dialog**: Record maintenance activities
- **Inline Editing**: Quick edits for fleet information

### Department Management
- Department selection and switching
- Team members list with role information
- Department-specific reports and fleet data
- Access control based on user permissions

### Reports System
- Create reports with:
  - Type (incident, financial, performance, general)
  - Priority (low, medium, high, critical)
  - Status tracking (draft → pending → review → approved/rejected/escalated)
- Filter and search capabilities
- Report detail dialog with full information
- Assignment and escalation features
- Audit trail

### Admin Panel
- User management
- Department access control dialog
- User list with role assignments
- Permission management

## 🚀 Getting Started

### Prerequisites
- Node.js 16+ and npm/bun
- Supabase account with configured project
- Environment variables configured

### Installation

```bash
# Clone the repository
git clone https://github.com/Powerpl123/hqpower_system.git
cd hqpower_system

# Install dependencies
npm install
# or
bun install

# Create .env file with Supabase credentials
cp .env.example .env
# Edit .env with your Supabase URL and key

# Start development server
npm run dev
```

The application will be available at `http://localhost:5173`

### Environment Variables
```env
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_PUBLISHABLE_KEY=your_supabase_key
```

## 📁 Project Structure

```
src/
├── components/           # React components
│   ├── admin/           # Admin panel components
│   ├── dashboard/       # Dashboard components
│   ├── department/      # Department management
│   ├── fleet/          # Fleet management dashboard
│   ├── layout/         # Layout components (sidebar, navbar)
│   ├── reports/        # Report management
│   └── ui/             # Shadcn/ui components
├── hooks/              # Custom React hooks
│   ├── useAuth.tsx     # Authentication context
│   ├── useFleets.tsx   # Fleet data management
│   ├── useReports.tsx  # Report data management
│   └── ...
├── pages/              # Page components
│   ├── Dashboard.tsx
│   ├── Reports.tsx
│   ├── Admin.tsx
│   ├── Department.tsx
│   └── ...
├── lib/                # Utility functions
└── integrations/
    └── supabase/       # Supabase client and types
```

## 🔄 Data Flow

1. **Authentication**: User logs in via Supabase Auth
2. **Profile Loading**: User profile and roles fetched from database
3. **Authorization**: User permissions checked against assigned roles
4. **Data Fetching**: Component-level hooks fetch data via Supabase queries
5. **Real-time Updates**: Supabase subscriptions provide live data updates
6. **UI Rendering**: Components render based on user role and permissions

## 🔐 Security Features

- Role-Based Access Control (RBAC)
- Department-level access restrictions
- Supabase Row Level Security (RLS) policies
- Secure authentication with Supabase Auth
- Protected API endpoints

## 📦 Building & Deployment

```bash
# Development build
npm run build:dev

# Production build
npm run build

# Preview production build
npm run preview

# Linting
npm run lint
```

### Vercel Deployment
- Configuration: `vercel.json`
- Automatic deployments from git pushes

## 🛠️ Development

### Available Scripts
- `npm run dev` - Start development server
- `npm run build` - Production build
- `npm run build:dev` - Development build
- `npm run preview` - Preview production build
- `npm run lint` - Run ESLint

### Code Style
- ESLint configured for TypeScript and React
- Prettier formatting
- Tailwind CSS utility-first approach

## 📝 Key Hooks

- `useAuth()` - Authentication state and methods
- `useUserRole()` - User role information
- `useDepartments()` - Department list management
- `useFleets()` - Fleet data and operations
- `useMaintenanceRecords()` - Maintenance tracking
- `useReports()` - Report management
- `useReportStats()` - Report statistics
- `useDepartmentMembers()` - Team member management

## 🔗 API Integration

All data operations go through Supabase:
- REST API for standard CRUD operations
- Real-time subscriptions for live updates
- Edge Functions for complex business logic
- PostgreSQL database with RLS policies

## 📱 Responsive Design

- Mobile-first approach
- Responsive grid layouts
- Breakpoints: sm, md, lg, xl
- Touch-friendly UI components

## 🐛 Debugging

Check browser console for logs and errors. Supabase provides detailed error messages for database operations.

## 📄 License

Proprietary - HQ Power System
- Edit files directly within the Codespace and commit and push your changes once you're done.

## What technologies are used for this project?

This project is built with:

- Vite
- TypeScript
- React
- shadcn-ui
- Tailwind CSS

## How can I deploy this project?

Simply open [Lovable](https://lovable.dev/projects/REPLACE_WITH_PROJECT_ID) and click on Share -> Publish.

## Can I connect a custom domain to my Lovable project?

Yes, you can!

To connect a domain, navigate to Project > Settings > Domains and click Connect Domain.

Read more here: [Setting up a custom domain](https://docs.lovable.dev/features/custom-domain#custom-domain)
