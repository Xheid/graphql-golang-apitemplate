CREATE EXTENSION pgcrypto;

CREATE TABLE IF NOT EXISTS companies (
    slug TEXT PRIMARY KEY,    
    id UUID NOT NULL,
    name TEXT NOT NULL,
    website TEXT NULL,
    logo TEXT NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS users (
    mail VARCHAR(254) PRIMARY KEY ,
    id UUID NOT NULL,
    last_name TEXT NULL,
    first_name TEXT NULL,
    password TEXT NOT NULL,
    access INTEGER NOT NULL,
    slug TEXT NOT NULL,
    company_id TEXT NOT NULL REFERENCES companies(slug) ON UPDATE CASCADE ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS projectstypes (
    slug TEXT PRIMARY KEY,
    id UUID NOT NULL,
    name TEXT NOT NULL,
    description TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS projects (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    subject TEXT NULL,
    address TEXT NULL,
    description TEXT NULL,
    post TEXT NULL,
    seat INTEGER NULL,
    slug TEXT NULL,
    company_id TEXT NOT NULL REFERENCES companies(slug) ON UPDATE CASCADE ON DELETE CASCADE,
    projecttype_id text NOT NULL REFERENCES projectstypes(slug) ON UPDATE CASCADE ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS feedbacks (
    id UUID PRIMARY KEY,
    content TEXT NOT NULL,
    slug TEXT NOT NULL,
    project_id UUID NOT NULL REFERENCES projects(id) ON UPDATE CASCADE ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS tags (
    slug TEXT PRIMARY KEY,
    id UUID NOT NULL,
    name TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS projectstags (
    id UUID PRIMARY KEY,
    project_id UUID NOT NULL REFERENCES projects(id) ON UPDATE CASCADE ON DELETE CASCADE,
    tag_id TEXT NOT NULL REFERENCES tags(slug) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dates (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    starts_at TIMESTAMP NOT NULL,
    finishes_at TIMESTAMP NOT NULL,
    project_id UUID NOT NULL REFERENCES projects(id) ON UPDATE CASCADE ON DELETE CASCADE,
    slug TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS inscriptions (
    id UUID PRIMARY KEY,
    email VARCHAR(254) NOT NULL,
    slug TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NULL,
    project_id UUID NOT NULL REFERENCES projects(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS medias (
    id UUID PRIMARY KEY,
    media_type TEXT NOT NULL,
    link TEXT NOT NULL,
    project_id UUID NOT NULL REFERENCES projects(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS renders (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    url TEXT NOT NULL,
    description TEXT NULL,
    slug TEXT NOT NULL,
    project_id UUID NOT NULL references projects(id) ON UPDATE CASCADE ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NULL 
);
