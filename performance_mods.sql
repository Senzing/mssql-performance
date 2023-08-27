ALTER TABLE LIB_FEAT DROP CONSTRAINT LIB_FEAT_PK;
DROP index LIB_FEAT. LIB_FEAT_SK;
ALTER TABLE LIB_FEAT ADD CONSTRAINT LIB_FEAT_PK PRIMARY KEY CLUSTERED (LIB_FEAT_ID) WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY=ON, FILLFACTOR=100);
-- make this PK be clustered
CREATE UNIQUE INDEX LIB_FEAT_SK ON LIB_FEAT(FEAT_HASH, FTYPE_ID, ANONYMIZED)
GO


ALTER TABLE DSRC_RECORD DROP CONSTRAINT DSRC_RECORD_PK;
DROP index DSRC_RECORD.DSRC_RECORD_SK;
--- UNCHANGED
ALTER TABLE DSRC_RECORD ADD CONSTRAINT DSRC_RECORD_PK PRIMARY KEY NONCLUSTERED (RECORD_ID, DSRC_ID)
CREATE INDEX DSRC_RECORD_SK ON DSRC_RECORD(ENT_SRC_KEY, DSRC_ID)

ALTER TABLE OBS_ENT DROP CONSTRAINT OBS_ENT_PK;
DROP index OBS_ENT.OBS_ENT_SK;
ALTER TABLE OBS_ENT ADD CONSTRAINT OBS_ENT_PK PRIMARY KEY NONCLUSTERED (OBS_ENT_ID) WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY=ON)
CREATE UNIQUE INDEX OBS_ENT_SK ON OBS_ENT(ENT_SRC_KEY, DSRC_ID)

ALTER TABLE RES_ENT DROP CONSTRAINT RES_ENT_PK;
ALTER TABLE RES_ENT ADD CONSTRAINT RES_ENT_PK PRIMARY KEY NONCLUSTERED (RES_ENT_ID) WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY=ON)

ALTER TABLE RES_ENT_OKEY DROP CONSTRAINT RES_ENT_OKEY_PK;
DROP index RES_ENT_OKEY.RES_ENT_OKEY_SK;
ALTER TABLE RES_ENT_OKEY ADD CONSTRAINT RES_ENT_OKEY_PK PRIMARY KEY NONCLUSTERED (OBS_ENT_ID)
CREATE CLUSTERED INDEX RES_ENT_OKEY_SK ON RES_ENT_OKEY(RES_ENT_ID, OBS_ENT_ID)

ALTER TABLE RES_FEAT_EKEY DROP CONSTRAINT RES_FEAT_EKEY_PK;
DROP index RES_FEAT_EKEY.RES_FEAT_EKEY_SK;
-- make this PK be clustered
ALTER TABLE RES_FEAT_EKEY ADD CONSTRAINT RES_FEAT_EKEY_PK PRIMARY KEY CLUSTERED (RES_ENT_ID, LIB_FEAT_ID, UTYPE_CODE)
 -- already unique based on the PK
CREATE INDEX RES_FEAT_EKEY_SK ON RES_FEAT_EKEY(LIB_FEAT_ID, RES_ENT_ID, UTYPE_CODE)

ALTER TABLE RES_FEAT_STAT DROP CONSTRAINT RES_FEAT_STAT_PK;
-- make this PK be clustered
ALTER TABLE RES_FEAT_STAT ADD CONSTRAINT RES_FEAT_STAT_PK PRIMARY KEY CLUSTERED (LIB_FEAT_ID) WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY=ON);

ALTER TABLE RES_RELATE DROP CONSTRAINT RES_RELATE_PK;
ALTER TABLE RES_RELATE ADD CONSTRAINT RES_RELATE_PK PRIMARY KEY NONCLUSTERED (RES_REL_ID) WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY=ON)

ALTER TABLE RES_REL_EKEY DROP CONSTRAINT RES_REL_EKEY_PK;
-- make this PK be clustered
ALTER TABLE RES_REL_EKEY ADD CONSTRAINT RES_REL_EKEY_PK PRIMARY KEY CLUSTERED (RES_ENT_ID, REL_ENT_ID)

ALTER TABLE LIB_UTYPE DROP CONSTRAINT LIB_UTYPE_PK;
-- UNCHANGED
ALTER TABLE LIB_UTYPE ADD CONSTRAINT LIB_UTYPE_PK PRIMARY KEY NONCLUSTERED (UTYPE_CODE)
GO

ALTER INDEX RES_FEAT_STAT_PK ON RES_FEAT_STAT REBUILD WITH (DATA_COMPRESSION=PAGE,FILLFACTOR=80,ONLINE=OFF);
ALTER INDEX RES_REL_EKEY_PK ON RES_REL_EKEY REBUILD WITH (DATA_COMPRESSION=PAGE,FILLFACTOR=80,ONLINE=OFF);
ALTER INDEX RES_ENT_OKEY_SK ON RES_ENT_OKEY REBUILD WITH (DATA_COMPRESSION=PAGE,FILLFACTOR=80,ONLINE=OFF);
ALTER INDEX RES_FEAT_EKEY_PK ON RES_FEAT_EKEY REBUILD WITH (DATA_COMPRESSION=PAGE,FILLFACTOR=80,ONLINE=OFF);
ALTER INDEX LIB_FEAT_PK ON LIB_FEAT REBUILD WITH (DATA_COMPRESSION=PAGE,FILLFACTOR=100,ONLINE=OFF);

ALTER TABLE RES_FEAT_STAT REBUILD WITH (DATA_COMPRESSION=PAGE,FILLFACTOR=80,ONLINE=OFF);
ALTER TABLE RES_REL_EKEY REBUILD WITH (DATA_COMPRESSION=PAGE,FILLFACTOR=80,ONLINE=OFF);
ALTER TABLE RES_ENT_OKEY REBUILD WITH (DATA_COMPRESSION=PAGE,FILLFACTOR=80,ONLINE=OFF);
ALTER TABLE RES_FEAT_EKEY REBUILD WITH (DATA_COMPRESSION=PAGE,FILLFACTOR=80,ONLINE=OFF);
ALTER TABLE LIB_FEAT REBUILD WITH (DATA_COMPRESSION=PAGE,FILLFACTOR=100,ONLINE=OFF);
GO
