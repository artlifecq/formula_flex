package com.editor.data
{
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.ProjectConfig;
	import com.editor.enum.SpellShapeType;

	/**
	 *
	 * 数据表数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-17 上午11:32:15
	 *
	 */
	dynamic public class TabelData extends ConfigData
	{
		public static var UID : int = 0;
		public var dataConstructor : Class = null;
		public var isInternal : Boolean = false;
		private var _fields : Array;
		private var _desc : ConfigDesc;
		/**
		 * 内建表ID
		 */
		public var builtInTabelId : int = 0;
		/**
		 * 内建字段名
		 */
		public var builtInFieldName : String = null;

		public function TabelData(id : int, name : String, filePath : String, fileDire : String, featureType : String, subFeatureType : String, funcTag : String, order : String)
		{
			super();
			this.id = id;
			this.name = name;
			this.tabelName = name;
			_fields = [];
			mFilePath = filePath;
			mFileDire = fileDire;
			mFeatureType = featureType;
			mSubFeatureType = subFeatureType;
			mFuncTag = funcTag;
			mOrder = order;
		}

		public function getConfigDesc() : ConfigDesc
		{
			if (!_desc)
			{
				_desc = new ConfigDesc();
				_desc.allowSameNameField = true;
				_desc.tabelName = name;
			}
			return _desc;
		}

		public function clearData() : void
		{
			if (_desc)
				_desc.clear();
		}

		public function get desc() : ConfigDesc
		{
			return _desc;
		}

		public function initFields(fields : Array) : void
		{
			_fields = fields;
			for each (var field : TabelFieldData in _fields)
			{
				field.isKey = (field.name == majorKey);
			}
			_fields.sortOn(["name"], Array.CASEINSENSITIVE);
		}

		public function addField(name : String) : TabelFieldData
		{
			var field : TabelFieldData = getField(name);
			if (field)
				return null;
			field = new TabelFieldData(name, TabelFieldData.getFieldName(name), "", 0, TabelFieldData.getFieldLabel(name), "", "", "");
			field.tabelName = this.tabelName;
			field.isKey = (field.name == majorKey);
			_fields.push(field);
			TabelFieldData.setInternalField(field);
			setFieldInputType(field);
			_fields.sortOn(["name"], Array.CASEINSENSITIVE);
			return field;
		}

		public function removeField(name : String) : TabelFieldData
		{
			var field : TabelFieldData = getField(name);
			if (!field)
				return null;
			var index : int = _fields.indexOf(field);
			if (index != -1)
				_fields.splice(index, 1);
			if (field.name == majorKey)
				majorKey = "";
			return field;
		}

		public function setFieldInputType(field : TabelFieldData) : void
		{
			if (field.name == TabelFieldData.SPELL_HURT_SHAPE_FIELD)
				_desc.listMapping[field.mFieldName] = SpellShapeType.getTypeList();
		}

		public function get fields() : Array
		{
			return _fields;
		}

		public function getFieldList() : Array
		{
			var datas : Array = [];
			for each (var field : TabelFieldData in _fields)
			{
				if (field.isInternal)
					continue;
				datas.push(field);
			}
			return datas;
		}

		public function hasField(name : String) : Boolean
		{
			for each (var field : TabelFieldData in _fields)
			{
				if (field.name == name)
				{
					return true;
				}
			}
			return false;
		}

		public function getField(name : String) : TabelFieldData
		{
			for each (var field : TabelFieldData in _fields)
			{
				if (field.name == name)
				{
					return field;
				}
			}
			return null;
		}

		public function getFieldByFieldName(fieldName : String) : TabelFieldData
		{
			for each (var field : TabelFieldData in _fields)
			{
				if (field.mFieldName == fieldName)
				{
					return field;
				}
			}
			return null;
		}

		public function initDescFields(desc : ConfigDesc) : void
		{
			for each (var field : TabelFieldData in _fields)
			{
				desc.addField("", field.mFieldName);
			}
		}

		public function get majorKeyField() : TabelFieldData
		{
			return getField(majorKey);
		}

		public function get mFilePath() : String
		{
			return this[TabelFieldData.FILE_PATH_FIELD_NAME];
		}

		public function set mFilePath(value : String) : void
		{
			this[TabelFieldData.FILE_PATH_FIELD_NAME] = value;
		}

		public function get mFileDire() : String
		{
			return this[TabelFieldData.FILE_DIRE_FIELD_NAME];
		}

		public function set mFileDire(value : String) : void
		{
			this[TabelFieldData.FILE_DIRE_FIELD_NAME] = value;
		}

		public function get mFeatureType() : String
		{
			return this[TabelFieldData.FEATURE_TYPE_FIELD_NAME];
		}

		public function set mFeatureType(value : String) : void
		{
			this[TabelFieldData.FEATURE_TYPE_FIELD_NAME] = value;
		}

		public function get mSubFeatureType() : String
		{
			return this[TabelFieldData.SUB_FEATURE_TYPE_FIELD_NAME];
		}

		public function set mSubFeatureType(value : String) : void
		{
			this[TabelFieldData.SUB_FEATURE_TYPE_FIELD_NAME] = value;
		}

		public function get mFuncTag() : String
		{
			return this[TabelFieldData.FUNC_TAG_FIELD_NAME];
		}

		public function set mFuncTag(value : String) : void
		{
			this[TabelFieldData.FUNC_TAG_FIELD_NAME] = value;
		}

		public function get mOrder() : String
		{
			return this[TabelFieldData.ORDER_FIELD_NAME];
		}

		public function set mOrder(value : String) : void
		{
			this[TabelFieldData.ORDER_FIELD_NAME] = value;
		}

		public function get tabelFilePath() : String
		{
			return ProjectConfig.getTabelCfgPath(mFilePath);
		}

		public function set tabelFilePath(value : String) : void
		{
			mFilePath = ProjectConfig.setTabelCfgPath(value);
		}

		public function get tabelDirePath() : String
		{
			return ProjectConfig.getTabelCfgPath(mFileDire);
		}

		public function set tabelDirePath(value : String) : void
		{
			mFileDire = ProjectConfig.setTabelCfgPath(value);
		}
	}
}
