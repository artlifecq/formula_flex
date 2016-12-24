package com.editor.manager
{
	import flash.data.SQLConnection;
	import flash.data.SQLMode;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.errors.SQLError;
	import flash.filesystem.File;

	/**
	 *
	 * 数据库管理
	 * @author L.L.M.Sunny
	 * 创建时间：2016-3-31 下午2:30:12
	 *
	 */
	public class DBManager
	{
		private static var _localSQLServer : SQLConnection;
		private static var _projectDbFile : File;

		public function DBManager()
		{
		}

		public static function openDB(file : File) : void
		{
			_projectDbFile = file.resolvePath(".game3DEditorDatabase");
			_localSQLServer = new SQLConnection();
			if (!setLocalSQLServer())
			{
				trace("连接失败");
				return;
			}
			tryCreateEffectResCfg();
		}

		public static function setLocalSQLServer() : Boolean
		{
			try
			{
				if (_localSQLServer && _localSQLServer.connected)
				{
					return true;
				}
				if (_projectDbFile)
				{
					if (_projectDbFile.exists)
					{
						_localSQLServer.open(_projectDbFile, SQLMode.UPDATE);
					}
					else
					{
						_localSQLServer.open(_projectDbFile);
					}
				}
			}
			catch (error : Error)
			{
				return false;
			}
			return true;
		}

		public static function executeSql(sqlString : String, cmdParams : SqlParameter) : int
		{
			var result : SQLResult = querySQL(sqlString, cmdParams);
			return result.rowsAffected;
		}

		public static function query(sqlString : String, cmdParams : SqlParameter) : Array
		{
			var result : SQLResult = querySQL(sqlString, cmdParams);
			return result ? result.data : null;
		}

		public static function querySQL(sqlString : String, cmdParams : SqlParameter) : SQLResult
		{
			if (!_localSQLServer)
				return null;
			var sqlstatement : SQLStatement = new SQLStatement();
			sqlstatement.sqlConnection = _localSQLServer;
			sqlstatement.text = sqlString;
			try
			{
				if (cmdParams && cmdParams.length > 0)
				{
					cmdParams.transParameters(sqlstatement);
				}
				sqlstatement.execute();
			}
			catch (error : SQLError)
			{
				trace(error.details);
				throw error;
			}
			return sqlstatement.getResult();
		}

		public static function querySQLWithOutParameter(sqlString : String) : Boolean
		{
			if (!_localSQLServer)
				return false;
			var sqlstatement : SQLStatement = new SQLStatement();
			sqlstatement.sqlConnection = _localSQLServer;
			sqlstatement.text = sqlString;
			try
			{
				sqlstatement.execute();
			}
			catch (error : SQLError)
			{
				trace(error.details);
				throw error;
				return false;
			}
			return true;
		}

		public static function exists(sqlString : String, cmdParams : SqlParameter) : Boolean
		{
			var result : Array = query(sqlString, cmdParams);
			return result && result.length > 0;
		}

		public static function getMaxID(fieldName : String, tableName : String) : uint
		{
			var sql : String = "SELECT MAX(" + fieldName + ") FROM " + tableName;
			var result : Array = query(sql, new SqlParameter());
			if (result && (result[0]["MAX(" + fieldName + ")"] != null))
				return result[0]["MAX(" + fieldName + ")"];
			else
				return 0;
		}

		public static function getRecordNum(tableName : String, fieldName : String, cmdParams : SqlParameter, wheresql : String = "") : uint
		{
			var sql : String = "SELECT COUNT(" + fieldName + ") FROM " + tableName;
			sql += " " + wheresql;
			var result : Array = query(sql, cmdParams);
			return result ? uint(result[0]["COUNT(" + fieldName + ")"].toString()) : 0;
		}

		public static function pageList(sqlString : String, cmdParams : SqlParameter, pageSize : uint, pageIndex : uint) : Array
		{
			sqlString += " LIMIT " + (pageSize * (pageIndex - 1)).toString() + ", " + pageSize.toString();
			return query(sqlString, cmdParams);
		}

		public static function clearCache() : void
		{
			if (!_localSQLServer)
				return;
			var stmt : SQLStatement = new SQLStatement();
			stmt.sqlConnection = _localSQLServer;
			stmt.text = "DELETE FROM statements";
			stmt.execute();
		}

		public static function tryCreateEffectResCfg() : void
		{
			try
			{
				if (!setLocalSQLServer())
				{
					trace("连接失败");
					return;
				}
				var sql : String = "CREATE TABLE IF NOT EXISTS EffectResCfg (" + //
					"id VARCHAR(20) PRIMARY KEY," + //
					"label VARCHAR(30) NOT NULL, " + //
					"img VARCHAR(30) NOT NULL)";

				var arr : Array = query(sql, null);
				if (arr == null)
				{
					arr = new Array();
				}
			}
			catch (e : Error)
			{
				trace("sql error ！@" + e.toString());
			}
		}

		public static function showLan() : void
		{
			try
			{
				if (!setLocalSQLServer())
				{
					trace("连接失败");
					return;
				}
				var sql : String = "select * from EffectResCfg";
				var arr : Array = query(sql, null);
				if (arr == null)
				{
					arr = new Array();
				}
			}
			catch (e : Error)
			{
				trace("sql error ！@" + e.toString());
			}
		}

		public static function addLan(name : String, res : String) : void
		{
			try
			{
				if (!setLocalSQLServer())
				{
					trace("连接失败");
					return;
				}
				var sql : String = "insert into EffectResCfg (name,res) values(@name,@res);";
				var parameter : SqlParameter = new SqlParameter();
				parameter["@name"] = name;
				parameter["@res"] = res;
				if (executeSql(sql, parameter) == 1)
				{
					showLan();
				}
			}
			catch (e : Error)
			{
				trace("sql error ！@" + e.toString());
			}
		}

//		public static function updLan(vo : LanVo, str : String) : void
//		{
//			try
//			{
//				if (!AIRSQLite.setLocalSQLServer(str))
//				{
//					trace("连接失败");
//					return;
//				}
//				var sql : String = "update lan set shot=@shot,display=@display where lid=@lid;";
//				var parameter : SqlParameter = new SqlParameter();
//				parameter["@shot"] = vo.shot;
//				parameter["@display"] = vo.dis;
//				parameter["@lid"] = vo.lanId;
//				if (AIRSQLite.executeSql(AIRSQLite.localSQLServer, sql, parameter) == 1)
//				{
//					dispatch(new LanEvent(LanEvent.LAN_UPD_SUCC));
//					showLan(str);
//				}
//			}
//			catch (e : Error)
//			{
//				trace("sql error ！@" + e.toString());
//				dispatch(new LanEvent(LanEvent.LAN_UPD_FAIL));
//				return;
//			}
//		}
//		

	}
}

import flash.data.SQLStatement;

dynamic class SqlParameter extends Object
{
	public function SqlParameter()
	{
	}

	public function transParameters(SQLStatementParameters : SQLStatement) : void
	{
		for (var i : String in this)
		{
			SQLStatementParameters.parameters[i] = this[i];
		}
	}

	public function clear() : void
	{
		for (var i : String in this)
		{
			delete this[i];
		}
	}

	public function get length() : uint
	{
		var len : uint = 0;
		for (var i : String in this)
		{
			len++;
		}
		return len;
	}
}
