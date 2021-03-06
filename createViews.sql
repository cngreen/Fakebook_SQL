CREATE VIEW VIEW_USER_INFORMATION AS 
	SELECT CAST(U.USER_ID AS VARCHAR2(100)) "USER_ID",
	U.FIRST_NAME,
	U.LAST_NAME,
	U.YEAR_OF_BIRTH,
	U.MONTH_OF_BIRTH,
	U.DAY_OF_BIRTH,
	U.GENDER,
	CC.CITY_NAME AS CURRENT_CITY,
	CC.STATE_NAME AS CURRENT_STATE,
	CC.COUNTRY_NAME AS CURRENT_COUNTRY,
	HC.CITY_NAME AS HOMETOWN_CITY,
	HC.STATE_NAME AS HOMETOWN_STATE,
	HC.COUNTRY_NAME AS HOMETOWN_COUNTRY,
	P.INSTITUTION AS INSTITUTION_NAME,
	E.PROGRAM_YEAR,
	CAST(P.CONCENTRATION AS CHAR(100)) "PROGRAM_CONCENTRATION",
	P.DEGREE AS PROGRAM_DEGREE
	FROM USERS U
	LEFT JOIN USER_CURRENT_CITY UCC ON U.USER_ID = UCC.USER_ID
	LEFT JOIN CITIES CC ON UCC.CURRENT_CITY_ID = CC.CITY_ID
	LEFT JOIN USER_HOMETOWN_CITY UHC ON U.USER_ID = UHC.USER_ID 
	LEFT JOIN CITIES HC ON UHC.HOMETOWN_CITY_ID = HC.CITY_ID
	LEFT JOIN EDUCATION E ON U.USER_ID = E.USER_ID
	LEFT JOIN PROGRAMS P ON E.PROGRAM_ID = P.PROGRAM_ID;

CREATE VIEW VIEW_ARE_FRIENDS AS
	SELECT CAST(USER1_ID AS VARCHAR2(100)) "USER1_ID", 
	CAST(USER2_ID AS VARCHAR2(100)) "USER2_ID"
	FROM FRIENDS;

CREATE VIEW VIEW_PHOTO_INFORMATION AS
	SELECT A.ALBUM_ID, 
	CAST(A.ALBUM_OWNER_ID AS VARCHAR2(100)) "OWNER_ID", 
	A.COVER_PHOTO_ID,
	A.ALBUM_NAME,
	A.ALBUM_CREATED_TIME,
	A.ALBUM_MODIFIED_TIME,
	A.ALBUM_LINK,
	A.ALBUM_VISIBILITY,
	P.PHOTO_ID,
	P.PHOTO_CAPTION,
	P.PHOTO_CREATED_TIME,
	P.PHOTO_MODIFIED_TIME,
	P.PHOTO_LINK
	FROM ALBUMS A, PHOTOS P
	WHERE A.ALBUM_ID = P.ALBUM_ID;

CREATE VIEW VIEW_TAG_INFORMATION AS
	SELECT TAG_PHOTO_ID AS PHOTO_ID, 
	CAST(TAG_SUBJECT_ID AS VARCHAR2(100)) "TAG_SUBJECT_ID", 
	TAG_CREATED_TIME,
	TAG_X, 
	TAG_Y 
	FROM TAGS;

CREATE VIEW VIEW_EVENT_INFORMATION AS
	SELECT CAST(E.EVENT_ID AS VARCHAR2(100)) "EVENT_ID",
	CAST(E.EVENT_CREATOR_ID AS VARCHAR2(100)) "EVENT_CREATOR_ID",
	E.EVENT_NAME,
	CAST(E.EVENT_TAGLINE AS VARCHAR2(1000)) "EVENT_TAGLINE",
	CAST(E.EVENT_DESCRIPTION AS VARCHAR2(4000)) "EVENT_DESCRIPTION",
	E.EVENT_HOST,
	E.EVENT_TYPE,
	E.EVENT_SUBTYPE,
	CAST(E.EVENT_LOCATION AS VARCHAR2(200)) "EVENT_LOCATION",
	C.CITY_NAME AS EVENT_CITY,
	C.STATE_NAME AS EVENT_STATE,
	C.COUNTRY_NAME AS EVENT_COUNTRY,
	E.EVENT_START_TIME,
	E.EVENT_END_TIME
	FROM USER_EVENTS E
	LEFT JOIN CITIES C
	ON E.EVENT_CITY_ID = C.CITY_ID;


