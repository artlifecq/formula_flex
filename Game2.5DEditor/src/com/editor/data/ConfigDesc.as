package com.editor.data
{
	import com.editor.cfg.ConfigData;

	import flash.utils.Dictionary;

	/**
	 *
	 * 配置描述
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-24 上午10:30:12
	 *
	 */
	public class ConfigDesc
	{
		private var _fieldIndexes : Dictionary;
		public var uid : int;
		private var _fieldHeads : Array;
		private var _fields : Array;
		public var values : Dictionary;
		public var fieldDescs : Array;
		public var fieldTips : Dictionary = new Dictionary();
		public var fieldLabels : Dictionary = new Dictionary();
		public var cacheDic : Dictionary;
		public var cacheFieldValue : Dictionary;
		public var selectedData : ConfigData;
		public var majorKey : String = null;
		public var tabelName : String = null;
		public var allowSameNameField : Boolean = false;
		public var builtInTables : Array;
		public var listMapping : Dictionary = new Dictionary();
		public var formatMapping : Dictionary = new Dictionary();

		public function ConfigDesc()
		{
			clear();
		}

		public function getSameFieldIndexes(fieldName : String) : Array
		{
			var indexes : Array = _fieldIndexes[fieldName];
			return indexes;
		}

		public function addField(fieldHead : String, name : String) : void
		{
			if (!name)
				return;
			_fieldHeads.push(fieldHead);
			var indexes : Array = _fieldIndexes[name];
			if (!indexes)
				_fieldIndexes[name] = [];
			indexes = _fieldIndexes[name];
			indexes.push(_fields.length);
			_fields.push(name);
		}

		public function getFieldCount() : int
		{
			return _fields.length;
		}

		public function getField(index : int) : String
		{
			return _fields[index];
		}

		public function hasField(name : String) : Boolean
		{
			return _fields.indexOf(name) > -1;
		}

		public function getFieldHead(index : int) : String
		{
			return _fieldHeads[index];
		}

		public function getFields() : Array
		{
			return _fields;
		}

		public function initDataFields(cfg : ConfigData) : void
		{
			var len : int = _fields.length;
			for (var index : int = 0; index < len; index++)
			{
				var fieldName : String = _fields[index];
				var newFieldName : String = getPropertyFieldName(fieldName, index);
				cfg.setValue(newFieldName, "");
				if (newFieldName != fieldName)
				{
					var builtInLinkIdFieldName : String = ConfigData.getBuiltInLinkIdFieldName(fieldName, index);
					cfg[builtInLinkIdFieldName] = "";
				}
			}
		}

		public function getPropertyFieldName(fieldName : String, index : int = 0) : String
		{
			if (allowSameNameField && fieldName != "id" && fieldName != "name")
			{
				var fieldIndexes : Array = getSameFieldIndexes(fieldName);
				if (fieldIndexes && fieldIndexes.length > 1)
					fieldName = ConfigData.getFieldNameWithIndex(fieldName, index);
			}
			return fieldName;
		}

		public function getLinkIdFieldNameHasValue(fieldName : String, configData : ConfigData) : String
		{
			if (allowSameNameField && fieldName != "id" && fieldName != "name")
			{
				var fieldIndexes : Array = getSameFieldIndexes(fieldName);
				if (fieldIndexes && fieldIndexes.length > 1)
				{
					var currFieldName : String;
					var len : int = fieldIndexes.length;
					for (var index : int = 0; index < len; index++)
					{
						currFieldName = ConfigData.getBuiltInLinkIdFieldName(fieldName, index);
						if (configData[currFieldName])
							return currFieldName;
					}
				}
			}
			return fieldName;
		}

		public function setRawData(desc : ConfigDesc) : void
		{
			this.uid = desc.uid;
			this.values = desc.values;
			this.fieldDescs = desc.fieldDescs;
			this.fieldTips = desc.fieldTips;
			this.fieldLabels = desc.fieldLabels;
			this.cacheDic = desc.cacheDic;
			this.cacheFieldValue = desc.cacheFieldValue;
		}

		public function removeFieldValueFromCache(fieldName : String) : void
		{
			for (var cacheKey : String in cacheFieldValue)
			{
				if (cacheKey.indexOf(fieldName + "=") > -1)
				{
					cacheFieldValue[cacheKey] = null;
					delete cacheFieldValue[cacheKey];
					break;
				}
			}
		}

		public function clear() : void
		{
			uid = 0;
			_fieldIndexes = new Dictionary();
			_fields = [];
			_fieldHeads = [];
			values = new Dictionary();
			fieldDescs = [];
			cacheDic = new Dictionary();
			cacheFieldValue = new Dictionary();
			selectedData = null;
			builtInTables = [];
		}
	}
}
