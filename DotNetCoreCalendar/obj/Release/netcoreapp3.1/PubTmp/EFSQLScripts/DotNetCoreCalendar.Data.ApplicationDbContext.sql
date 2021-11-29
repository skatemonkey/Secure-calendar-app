IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(128) NOT NULL,
        [ProviderKey] nvarchar(128) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(128) NOT NULL,
        [Name] nvarchar(128) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'00000000000000_CreateIdentitySchema', N'3.1.20');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211016063805_eventslocation')
BEGIN
    CREATE TABLE [Locations] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_Locations] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211016063805_eventslocation')
BEGIN
    CREATE TABLE [Events] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [Description] nvarchar(max) NULL,
        [StartTime] datetime2 NOT NULL,
        [EndTime] datetime2 NOT NULL,
        [LocationId] int NULL,
        [UserId] nvarchar(450) NULL,
        CONSTRAINT [PK_Events] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Events_Locations_LocationId] FOREIGN KEY ([LocationId]) REFERENCES [Locations] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Events_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211016063805_eventslocation')
BEGIN
    CREATE INDEX [IX_Events_LocationId] ON [Events] ([LocationId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211016063805_eventslocation')
BEGIN
    CREATE INDEX [IX_Events_UserId] ON [Events] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211016063805_eventslocation')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20211016063805_eventslocation', N'3.1.20');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [AspNetRoleClaims] DROP CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [AspNetUserClaims] DROP CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [AspNetUserLogins] DROP CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [AspNetUserTokens] DROP CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [AspNetUserTokens] DROP CONSTRAINT [PK_AspNetUserTokens];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [AspNetUserRoles] DROP CONSTRAINT [PK_AspNetUserRoles];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [AspNetUserLogins] DROP CONSTRAINT [PK_AspNetUserLogins];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [AspNetUserClaims] DROP CONSTRAINT [PK_AspNetUserClaims];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [AspNetRoles] DROP CONSTRAINT [PK_AspNetRoles];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [AspNetRoleClaims] DROP CONSTRAINT [PK_AspNetRoleClaims];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    IF SCHEMA_ID(N'Identity') IS NULL EXEC(N'CREATE SCHEMA [Identity];');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER SCHEMA [Identity] TRANSFER [Locations];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER SCHEMA [Identity] TRANSFER [Events];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER SCHEMA [Identity] TRANSFER [AspNetUsers];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    EXEC sp_rename N'[AspNetUserTokens]', N'UserTokens';
    ALTER SCHEMA [Identity] TRANSFER [UserTokens];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    EXEC sp_rename N'[AspNetUserRoles]', N'UserRoles';
    ALTER SCHEMA [Identity] TRANSFER [UserRoles];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    EXEC sp_rename N'[AspNetUserLogins]', N'UserLogins';
    ALTER SCHEMA [Identity] TRANSFER [UserLogins];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    EXEC sp_rename N'[AspNetUserClaims]', N'UserClaims';
    ALTER SCHEMA [Identity] TRANSFER [UserClaims];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    EXEC sp_rename N'[AspNetRoles]', N'Role';
    ALTER SCHEMA [Identity] TRANSFER [Role];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    EXEC sp_rename N'[AspNetRoleClaims]', N'RoleClaims';
    ALTER SCHEMA [Identity] TRANSFER [RoleClaims];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    EXEC sp_rename N'[Identity].[UserRoles].[IX_AspNetUserRoles_RoleId]', N'IX_UserRoles_RoleId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    EXEC sp_rename N'[Identity].[UserLogins].[IX_AspNetUserLogins_UserId]', N'IX_UserLogins_UserId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    EXEC sp_rename N'[Identity].[UserClaims].[IX_AspNetUserClaims_UserId]', N'IX_UserClaims_UserId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    EXEC sp_rename N'[Identity].[RoleClaims].[IX_AspNetRoleClaims_RoleId]', N'IX_RoleClaims_RoleId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [Identity].[AspNetUsers] ADD [FullName] nvarchar(max) NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [Identity].[AspNetUsers] ADD [ProfilePicture] varbinary(max) NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Identity].[UserTokens]') AND [c].[name] = N'Name');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Identity].[UserTokens] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Identity].[UserTokens] ALTER COLUMN [Name] nvarchar(450) NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Identity].[UserTokens]') AND [c].[name] = N'LoginProvider');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Identity].[UserTokens] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [Identity].[UserTokens] ALTER COLUMN [LoginProvider] nvarchar(450) NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Identity].[UserLogins]') AND [c].[name] = N'ProviderKey');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Identity].[UserLogins] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [Identity].[UserLogins] ALTER COLUMN [ProviderKey] nvarchar(450) NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Identity].[UserLogins]') AND [c].[name] = N'LoginProvider');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Identity].[UserLogins] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [Identity].[UserLogins] ALTER COLUMN [LoginProvider] nvarchar(450) NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [Identity].[UserTokens] ADD CONSTRAINT [PK_UserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [Identity].[UserRoles] ADD CONSTRAINT [PK_UserRoles] PRIMARY KEY ([UserId], [RoleId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [Identity].[UserLogins] ADD CONSTRAINT [PK_UserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [Identity].[UserClaims] ADD CONSTRAINT [PK_UserClaims] PRIMARY KEY ([Id]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [Identity].[Role] ADD CONSTRAINT [PK_Role] PRIMARY KEY ([Id]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [Identity].[RoleClaims] ADD CONSTRAINT [PK_RoleClaims] PRIMARY KEY ([Id]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [Identity].[RoleClaims] ADD CONSTRAINT [FK_RoleClaims_Role_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Identity].[Role] ([Id]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [Identity].[UserClaims] ADD CONSTRAINT [FK_UserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [Identity].[AspNetUsers] ([Id]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [Identity].[UserLogins] ADD CONSTRAINT [FK_UserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [Identity].[AspNetUsers] ([Id]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [Identity].[UserRoles] ADD CONSTRAINT [FK_UserRoles_Role_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Identity].[Role] ([Id]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [Identity].[UserRoles] ADD CONSTRAINT [FK_UserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [Identity].[AspNetUsers] ([Id]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    ALTER TABLE [Identity].[UserTokens] ADD CONSTRAINT [FK_UserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [Identity].[AspNetUsers] ([Id]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211017095630_combine_user_management')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20211017095630_combine_user_management', N'3.1.20');
END;

GO

