USE SE398_JGolembiesky;
GO

CREATE TABLE dbo.tv_creators (
    creator_id INT NOT NULL PRIMARY KEY,
    creator_name NVARCHAR(50) NOT NULL,
    creator_description NVARCHAR(MAX)
);

CREATE TABLE dbo.producers (
    producer_id INT NOT NULL PRIMARY KEY,
    producer_name NVARCHAR (50),
    producer_description NVARCHAR(MAX)
);

CREATE TABLE dbo.tv_shows (
    show_id INT NOT NULL PRIMARY KEY,
    show_name NVARCHAR(50) NOT NULL,
    creator_id INT FOREIGN KEY REFERENCES tv_creators(creator_id),
    producer_id INT FOREIGN KEY REFERENCES producers(producer_id),
    tv_description NVARCHAR(MAX)
);

CREATE TABLE dbo.tv_episodes(

    episode_id INT NOT NULL PRIMARY KEY,
    show_id INT FOREIGN KEY REFERENCES tv_shows(show_id),
    season_num INT NOT NULL,
    episode_num INT NOT NULL,
    episode_description NVARCHAR(MAX)

);

CREATE TABLE dbo.film_directors(
    director_id INT NOT NULL PRIMARY KEY,
    director_name NVARCHAR(50) NOT NULL,
    director_description NVARCHAR(MAX)
);

CREATE TABLE dbo.films (
    film_id INT NOT NULL PRIMARY KEY,
    film_name NVARCHAR(50) NOT NULL,
    director_id INT FOREIGN KEY REFERENCES dbo.film_directors(director_id) NOT NULL,
    producer_id INT FOREIGN KEY REFERENCES dbo.producers(producer_id) NOT NULL,
    release_date DATETIME
);
CREATE TABLE dbo.music_label(
    label_id INT NOT NULL PRIMARY KEY,
    label_name NVARCHAR(50) NOT NULL,
    label_description NVARCHAR(MAX)
);
CREATE TABLE dbo.music_album(
    album_id INT NOT NULL PRIMARY KEY,
    album_name NVARCHAR(100) NOT NULL,
    artist_id INT NOT NULL FOREIGN KEY REFERENCES dbo.music_artist(artist_id),
    label_id INT NOT NULL FOREIGN KEY REFERENCES dbo.music_label(label_id),
    release DATETIME NOT NULL
);

CREATE TABLE dbo.music_track(
    track_id INT NOT NULL PRIMARY KEY,
    track_name NVARCHAR(100),
    artist_id INT NOT NULL FOREIGN KEY REFERENCES dbo.music_artist(artist_id),
    album_id INT NOT NULL FOREIGN KEY REFERENCES dbo.music_album(album_id),
    track_num INT NOT NULL
);

CREATE TABLE dbo.vg_publishers(
publisher_id INT NOT NULL PRIMARY KEY,
publisher_name NVARCHAR(50) NOT NULL,
publisher_description NVARCHAR(MAX)
);

CREATE TABLE dbo.vg_developers(
developer_id INT NOT NULL PRIMARY KEY,
developer_name NVARCHAR(50) NOT NULL,
developer_description NVARCHAR(MAX)
);
CREATE TABLE dbo.vg_platforms(
    platform_id INT NOT NULL PRIMARY KEY,
    platform_name NVARCHAR(50) NOT NULL,
    publisher_id INT NOT NULL FOREIGN KEY REFERENCES dbo.vg_publishers(publisher_id),
    platform_description NVARCHAR(MAX)
);

CREATE TABLE dbo.vg_title(
    title_id INT NOT NULL PRIMARY KEY,
    title_name NVARCHAR(50) NOT NULL,
    platform_id INT NOT NULL FOREIGN KEY REFERENCES dbo.vg_platforms(platform_id),
    publisher_id INT NOT NULL FOREIGN KEY REFERENCES dbo.vg_publishers(publisher_id),
    developer_id INT NOT NULL FOREIGN KEY REFERENCES dbo.vg_developers(developer_id),
    release_date datetime NOT NULL
);
GO