/*================================================================================*/
/* DDL SCRIPT                                                                     */
/*================================================================================*/
/*  Title    : ABC-Framework: Profile                                             */
/*  FileName : abc-profile.ecm                                                    */
/*  Platform : MySQL 5                                                            */
/*  Version  :                                                                    */
/*  Date     : zaterdag 25 november 2017                                          */
/*================================================================================*/
/*================================================================================*/
/* CREATE TABLES                                                                  */
/*================================================================================*/

CREATE TABLE `ABC_AUTH_PROFILE` (
  `pro_id` SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
  `cmp_id` SMALLINT UNSIGNED NOT NULL,
  `pro_flags` INT UNSIGNED NOT NULL,
  `pro_rol_ids` VARCHAR(100) CHARACTER SET ascii,
  CONSTRAINT `PK_ABC_AUTH_PROFILE` PRIMARY KEY (`pro_id`)
);

/*
COMMENT ON COLUMN `ABC_AUTH_PROFILE`.`pro_flags`
The aggregated flags of the roles of this profile.
*/

/*
COMMENT ON COLUMN `ABC_AUTH_PROFILE`.`pro_rol_ids`
The natural key of a profile: a space separated list of the roles of this profile.
*/

/*================================================================================*/
/* CREATE INDEXES                                                                 */
/*================================================================================*/

CREATE INDEX `IX_ABC_AUTH_PROFILE1` ON `ABC_AUTH_PROFILE` (`cmp_id`);

CREATE UNIQUE INDEX `IX_ABC_AUTH_PROFILE2` ON `ABC_AUTH_PROFILE` (`pro_rol_ids`);

/*================================================================================*/
/* CREATE FOREIGN KEYS                                                            */
/*================================================================================*/

ALTER TABLE `ABC_AUTH_PROFILE`
  ADD CONSTRAINT `FK_ABC_AUTH_PROFILE_ABC_AUTH_COMPANY`
  FOREIGN KEY (`cmp_id`) REFERENCES `ABC_AUTH_COMPANY` (`cmp_id`);
