package com.editor.cfg
{
	import com.editor.data.ConfigDesc;
	import com.editor.data.TabelData;
	import com.editor.data.TabelFieldData;
	import com.editor.events.ConfigDataEvent;
	import com.editor.manager.DataStructuresManager;

	import flash.utils.Dictionary;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;

	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-24 上午10:30:12
	 *
	 */
	dynamic public class ConfigData extends Proxy
	{
		public static const FIELD_INDEX_SEPARATOR : String = "__$$$__";
		public static const FIELD_BUILT_IN_LINK_ID_SEPARATOR : String = "__$LINK_ID$__";

		private var _id : int = 0;
		private var _name : String = "";
		public var tabelName : String = "";
		/**
		 * 表的key字段 
		 */		
		public var majorKey : String = "";
		private var _properties : Dictionary;
		private var _priorityOrderProperties : Array;
		private var _fieldExpressionByName : Dictionary;

		public function ConfigData()
		{
			_properties = new Dictionary();
			_priorityOrderProperties = [];
			_fieldExpressionByName = new Dictionary();
		}

		public function init() : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(tabelName);
			if (tabel)
			{
				for each (var fieldData : TabelFieldData in tabel.fields)
				{
					if (fieldData.mDefaultValue) //&& cfg.hasOwnProperty(fieldName)
					{
						this.setValue(fieldData.mFieldName, fieldData.mDefaultValue, false);
					}
					if (fieldData.mFieldExpression)
					{
						this.addFieldExpression(fieldData.mFieldName, fieldData.mFieldExpression);
					}
				}
			}
		}

		public function inited() : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(tabelName);
			if (tabel)
			{
				var configDesc : ConfigDesc = tabel.getConfigDesc();
				for each (var fieldData : TabelFieldData in tabel.fields)
				{
					if (fieldData.isKey)
					{
						var datas : Array = configDesc ? ConfigData.getCfgByFieldValue(configDesc, fieldData.mFieldName, this[fieldData.mFieldName]) : null;
						if (datas && datas.length > 1)
						{
							var fieldValue : String = this[fieldData.mFieldName];
							var pattern : RegExp = /\(\d+\)/g;
							var result : Array = fieldValue.match(pattern);
							var indexStr : String = (result && result.length > 0) ? result[result.length - 1] : null;
							if (indexStr && indexStr == fieldValue.substr(fieldValue.length - indexStr.length))
								fieldValue = fieldValue.substr(0, fieldValue.length - indexStr.length);
							this[fieldData.mFieldName] = fieldValue + "(" + id + ")";
						}
					}
					if (fieldData.mFieldExpression)
					{
						this.addFieldExpression(fieldData.mFieldName, fieldData.mFieldExpression);
					}
				}
			}
		}

		public function initLinkTabelValues() : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(tabelName);
			if (tabel)
			{
				var configDesc : ConfigDesc = tabel.getConfigDesc();
				for each (var fieldData : TabelFieldData in tabel.fields)
				{
					if (fieldData.mLinkTabel && fieldData.linkEnable)
					{
						var linkTabel : TabelData = DataStructuresManager.getInstance().getTabelById(int(fieldData.mLinkTabel));
						var linkConfigDesc : ConfigDesc = linkTabel.getConfigDesc();
						var linkData : ConfigData = linkConfigDesc.selectedData;
						if (linkData && linkTabel.majorKeyField)
						{
							this[fieldData.mFieldName] = linkData[linkTabel.majorKeyField.mFieldName];
							this.name = linkData.name;
						}
					}
				}
			}
		}

		private function addPriorityOrderProperty(name : String) : void
		{
			if (_priorityOrderProperties.indexOf(name) == -1)
				_priorityOrderProperties.push(name);
		}

		public function getSortProperties() : Array
		{
			var props : Array = [];
			for (var pn : String in _properties)
			{
				if (_priorityOrderProperties.indexOf(pn) == -1)
					props.push(pn);
			}
			props.sort(Array.CASEINSENSITIVE);
			props = _priorityOrderProperties.concat(props);
			return props;
		}

		public function get id() : int
		{
			return _id;
		}

		public function set id(value : int) : void
		{
			_id = value;
			setProperty("id", value);
		}

		public function get name() : String
		{
			return _name;
		}

		public function set name(value : String) : void
		{
			_name = value;
			setProperty("name", value);
		}

		public function get properties() : Dictionary
		{
			return _properties;
		}

		flash_proxy override function setProperty(name : *, value : *) : void
		{
			setProperty(name, value);
		}

		flash_proxy override function getProperty(name : *) : *
		{
			return getProperty(name);
		}

		flash_proxy override function callProperty(name : *, ... rest) : *
		{
			return getProperty(name);
		}

		flash_proxy override function hasProperty(name : *) : Boolean
		{
			return _properties.hasOwnProperty(name);
		}

		protected function setProperty(name : String, value : *) : void
		{
			var valueObj : Object = _properties[name];
			if (valueObj is String)
			{
				value = String(value);
				if (String(valueObj) == String(value))
					return;
			}
			else if (valueObj is int || valueObj is uint || valueObj is Number)
			{
				value = Number(value);
				if (Number(valueObj) == Number(value))
					return;
			}
			else if (valueObj is Boolean)
			{
				value = Boolean(value);
				if (Boolean(valueObj) == Boolean(value))
					return;
			}
			else
			{
				if (valueObj == value)
					return;
			}
			_properties[name] = value;
			addPriorityOrderProperty(name);
		}

		protected function getProperty(name : String) : *
		{
			var valueObj : Object = _properties[name];
			if (valueObj is String)
			{
				valueObj = String(valueObj);
			}
			else if (valueObj is int || valueObj is uint || valueObj is Number)
			{
				valueObj = Number(valueObj);
			}
			else if (valueObj is Boolean)
			{
				valueObj = Boolean(valueObj);
			}
			return valueObj;
		}

		public function setValue(name : String, value : *, dispatchEvent : Boolean = true) : void
		{
			var valueObj : Object = this[name];
			if (valueObj is String)
			{
				value = String(value);
				if (String(valueObj) == String(value))
					return;
			}
			else if (valueObj is int || valueObj is uint || valueObj is Number)
			{
				value = Number(value);
				if (Number(valueObj) == Number(value))
					return;
			}
			else if (valueObj is Boolean)
			{
				value = Boolean(value);
				if (Boolean(valueObj) == Boolean(value))
					return;
			}
			else
			{
				if (valueObj == value)
					return;
			}
			this[name] = value;
			propertyProcessor(this, name);
			if (dispatchEvent)
				EventManager.dispatchEvent(ConfigDataEvent.CONFIG_DATA_CHANGE, this, name);
		}

		public function addFieldExpression(name : String, expression : String) : void
		{
			if (name)
				_fieldExpressionByName[name] = expression;
		}

		public function copyFrom(data : ConfigData) : void
		{
			this.name = data.name;
			for (var name : String in _properties)
			{
				this[name] = data[name];
			}
		}

		public static function getDataValueWithPropertyType(data : Object, name : String, value : String) : Object
		{
			var valueObj : Object = data[name];
			if (valueObj is String)
			{
				valueObj = String(value);
			}
			else if (valueObj is int || valueObj is uint || valueObj is Number)
			{
				valueObj = Number(value);
			}
			else if (valueObj is Boolean)
			{
				valueObj = value == "1" ? true : false;
			}
			return valueObj;
		}

		public static function getValueStringWithPropertyType(data : Object, name : String) : String
		{
			var valueObj : Object = data[name];
			if (valueObj is String)
			{
				valueObj = String(valueObj);
			}
			else if (valueObj is int || valueObj is uint || valueObj is Number)
			{
				valueObj = String(valueObj);
			}
			else if (valueObj is Boolean)
			{
				valueObj = valueObj ? "1" : "";
			}
			return String(valueObj);
		}

		private static function propertyProcessor(data : ConfigData, name : String) : void
		{
			var pattern : RegExp = /^[A-Za-z0-9_\.\-]+$/;
			var result : Object = pattern.exec(data[name]);
			if (result)
				mergeProperty(data, name);
			else
				assignProperty(data, name);
		}

		private static function mergeProperty(data : ConfigData, name : String) : void
		{
			for (var dataProvidedFieldname : String in data._fieldExpressionByName)
			{
				var keyIndex : int = -1;
				var fieldExpressionStr : String = data._fieldExpressionByName[dataProvidedFieldname];
				var resultFieldValue : String = "";
				var pattern : RegExp;
				var fieldExecStr : String = "";
				var valueIndex : int;
				var fieldResult : Object;
				var separatorExecStr : String = "";
				var separatorResult : Object;
				var fieldName : String = null;
				var fieldValue : String;

				while (fieldExpressionStr)
				{
					keyIndex++;
					pattern = /^[A-Za-z0-9_\.\-]+/g;
					fieldResult = pattern.exec(fieldExpressionStr);
					fieldExecStr = fieldResult ? fieldResult[0] : null;
					if (fieldExecStr)
					{
						fieldExpressionStr = fieldExpressionStr.substring(fieldExpressionStr.indexOf(fieldExecStr) + fieldExecStr.length);
					}
					else
					{
						resultFieldValue = null;
						break;
					}

					fieldName = fieldExecStr;
					if (fieldExecStr == name)
					{
						resultFieldValue += data[fieldName];
					}
					else
					{
						fieldValue = data[dataProvidedFieldname];
						if (!fieldValue)
						{
							resultFieldValue += data[fieldName];
						}
						valueIndex = -1;
						fieldExecStr = "";
						while (fieldValue && fieldExecStr != null)
						{
							valueIndex++;
							pattern = /^[^=;]+/g;
							fieldResult = pattern.exec(fieldValue);
							fieldExecStr = fieldResult ? fieldResult[0] : null;
							if (fieldExecStr)
							{
								fieldValue = fieldValue.substring(fieldValue.indexOf(fieldExecStr) + fieldExecStr.length);
								if (valueIndex == keyIndex)
								{
									resultFieldValue += fieldExecStr;
									break;
								}
							}
							else
							{
								resultFieldValue += data[fieldName];
								break;
							}

							if (fieldValue)
							{
								pattern = /^[=;]+/g;
								separatorResult = pattern.exec(fieldValue);
								separatorExecStr = separatorResult ? separatorResult[0] : null;
								if (separatorExecStr)
								{
									fieldValue = fieldValue.substring(fieldValue.indexOf(separatorExecStr) + separatorExecStr.length);
								}
								else
								{
									break;
								}
							}
						}
					}

					if (fieldExpressionStr)
					{
						pattern = /^[=;]+/g;
						separatorResult = pattern.exec(fieldExpressionStr);
						separatorExecStr = separatorResult ? separatorResult[0] : null;
						if (separatorExecStr)
						{
							fieldExpressionStr = fieldExpressionStr.substring(fieldExpressionStr.indexOf(separatorExecStr) + separatorExecStr.length);
							resultFieldValue += separatorExecStr;
						}
						else
						{
							resultFieldValue = null;
							break;
						}
					}
				}

				if (resultFieldValue)
				{
					fieldValue = data[dataProvidedFieldname];
					valueIndex = -1;
					fieldExecStr = "";
					while (fieldValue && fieldExecStr != null)
					{
						valueIndex++;
						pattern = /^[^=;]+/g;
						fieldResult = pattern.exec(fieldValue);
						fieldExecStr = fieldResult ? fieldResult[0] : null;
						if (fieldExecStr)
						{
							fieldValue = fieldValue.substring(fieldValue.indexOf(fieldExecStr) + fieldExecStr.length);
						}
						else
						{
							resultFieldValue += fieldValue;
							break;
						}

						if (fieldValue)
						{
							pattern = /^[=;]+/g;
							separatorResult = pattern.exec(fieldValue);
							separatorExecStr = separatorResult ? separatorResult[0] : null;
							if (separatorExecStr)
							{
								if (valueIndex >= keyIndex)
								{
									resultFieldValue += fieldValue;
									break;
								}
								fieldValue = fieldValue.substring(fieldValue.indexOf(separatorExecStr) + separatorExecStr.length);
							}
							else
							{
								resultFieldValue += fieldValue;
								break;
							}
						}
					}
				}

				if (resultFieldValue)
				{
					data[dataProvidedFieldname] = resultFieldValue;
				}
			}
		}

		private static function assignProperty(data : ConfigData, dataProvidedFieldname : String) : void
		{
			var fieldExpressionStr : String = data._fieldExpressionByName[dataProvidedFieldname];
			if (!fieldExpressionStr)
				return;

			var keyIndex : int = -1;
			var fieldName : String = null;
			var pattern : RegExp;
			var fieldExecStr : String = "";
			var fieldResult : Object;
			var separatorExecStr : String = "";
			var separatorResult : Object;
			while (fieldExpressionStr)
			{
				keyIndex++;
				pattern = /^[A-Za-z0-9_\.\-]+/g;
				fieldResult = pattern.exec(fieldExpressionStr);
				fieldExecStr = fieldResult ? fieldResult[0] : null;
				if (fieldExecStr)
				{
					fieldExpressionStr = fieldExpressionStr.substring(fieldExpressionStr.indexOf(fieldExecStr) + fieldExecStr.length);
				}
				else
				{
					break;
				}

				if (fieldExecStr)
				{
					if (!data.hasOwnProperty(fieldExecStr))
						data[fieldExecStr] = "";
					fieldName = fieldExecStr;
					var fieldValue : String = data[dataProvidedFieldname];
					//trace(fieldValue);
					var valueIndex : int = -1;
					fieldExecStr = "";
					while (fieldValue && fieldExecStr != null)
					{
						valueIndex++;
						pattern = /^[^=;%]+/g;
						fieldResult = pattern.exec(fieldValue);
						fieldExecStr = fieldResult ? fieldResult[0] : null;
						if (fieldExecStr)
						{
							if (valueIndex == keyIndex)
							{
								data[fieldName] = fieldExecStr;
								break;
							}
							fieldValue = fieldValue.substring(fieldValue.indexOf(fieldExecStr) + fieldExecStr.length);
						}
						else
						{
							data[fieldName] = "";
							break;
						}

						if (fieldValue)
						{
							pattern = /^[=;]+/g;
							separatorResult = pattern.exec(fieldValue);
							separatorExecStr = separatorResult ? separatorResult[0] : null;
							if (separatorExecStr)
							{
								fieldValue = fieldValue.substring(fieldValue.indexOf(separatorExecStr) + separatorExecStr.length);
							}
							else
							{
								data[fieldName] = "";
								break;
							}
						}
					}
				}

				if (fieldExpressionStr)
				{
					pattern = /^[=;]+/g;
					separatorResult = pattern.exec(fieldExpressionStr);
					separatorExecStr = separatorResult ? separatorResult[0] : null;
					if (separatorExecStr)
					{
						fieldExpressionStr = fieldExpressionStr.substring(fieldExpressionStr.indexOf(separatorExecStr) + separatorExecStr.length);
					}
					else
					{
						break;
					}
				}
			}
		}

		public static function getCacheDatas(configDesc : ConfigDesc, searchKey : String = "", fields : Array = null, absoluteField : String = null, absoluteValue : String = null) : Dictionary
		{
			var result : Dictionary;
			if (searchKey || absoluteField)
			{
				result = new Dictionary();
				if (fields)
				{
					for each (var data : ConfigData in configDesc.cacheDic)
					{
						for each (var field : String in fields)
						{
							if ((String(data[field]).indexOf(searchKey) != -1) && (!absoluteField || data[absoluteField] == absoluteValue))
							{
								result[data.id] = data;
								break;
							}
						}
					}
				}
			}
			else
			{
				if (configDesc)
					result = configDesc.cacheDic;
			}
			return result;
		}

		public static function create(configDesc : ConfigDesc, fields : Array = null, values : Array = null, constructor : Class = null, fillInitData : Boolean = false, cfg : ConfigData = null) : ConfigData
		{
			configDesc.uid++;
			if (!cfg)
				cfg = constructor ? new constructor() : new ConfigData();
			configDesc.initDataFields(cfg);
			cfg.majorKey = configDesc.majorKey;
			cfg.tabelName = configDesc.tabelName;
			if (fillInitData)
			{
				if (configDesc.selectedData)
					cfg.copyFrom(configDesc.selectedData);
				else
					cfg.initLinkTabelValues();
			}
			cfg.id = configDesc.uid;
			cfg.init();
			if (fields && values)
			{
				var len : int = fields.length;
				for (var i : int = 0; i < len; i++)
				{
					var fieldName : String = fields[i];
					var fieldValue : Object = values[i];
					cfg.setValue(fieldName, fieldValue);
					if (fieldName == "id" && int(fieldValue) > configDesc.uid)
						configDesc.uid = int(fieldValue);
				}
			}
			configDesc.cacheDic[cfg.id] = cfg;
			cfg.inited();
			return cfg;
		}

		public static function remove(configDesc : ConfigDesc, id : int) : void
		{
			var cfg : ConfigData = getCfg(configDesc, id);
			if (configDesc.selectedData == cfg)
				configDesc.selectedData = null;

			configDesc.cacheDic[id] = null;
			delete configDesc.cacheDic[id];
			EventManager.dispatchEvent(ConfigDataEvent.CONFIG_DATA_REMOVE, cfg);
		}

		public static function getCfg(configDesc : ConfigDesc, id : int) : ConfigData
		{
			return configDesc.cacheDic[id];
		}

		public static function getCfgByFieldValue(configDesc : ConfigDesc, field : String, value : String, isStrict : Boolean = false) : Array
		{
			var rtn : Array = [];
			var values : Array = null;
			if (value && value.indexOf(";") > -1)
			{
				values = value.split(";");
			}
			else
			{
				values = [value];
			}
			var data : ConfigData;
			var fieldValues : Array;
			var len : int = values.length;
			for each (value in values)
			{
				var isExists : Boolean = false;
				var cacheKey : String = field + "=" + value;
				data = configDesc.cacheFieldValue[cacheKey];
				if (data)
				{
					rtn.push(data);
					isExists = true;
				}
				else
				{
					for each (data in configDesc.cacheDic)
					{
						fieldValues = null;
						if (String(data[field]).indexOf(";") > -1)
						{
							fieldValues = String(data[field]).split(";");
						}
						else
						{
							fieldValues = [String(data[field])];
						}
						if (fieldValues.indexOf(value) > -1)
						{
							rtn.push(data);
							isExists = true;
							configDesc.cacheFieldValue[cacheKey] = data;
						}
					}
				}
				if (isStrict && !isExists)
				{
					rtn.push(null);
				}
			}
			return rtn;
		}

		public static function getOriginalFieldName(fieldName : String) : String
		{
			var index : int = fieldName.indexOf(FIELD_INDEX_SEPARATOR);
			if (index > -1)
				return fieldName.substring(0, index);
			index = fieldName.indexOf(FIELD_BUILT_IN_LINK_ID_SEPARATOR);
			if (index > -1)
				return fieldName.substring(0, index);
			return fieldName;
		}

		public static function getFieldNameWithIndex(fieldName : String, index : int) : String
		{
			var separIndex : int = fieldName.indexOf(FIELD_INDEX_SEPARATOR);
			if (separIndex > -1)
				fieldName = fieldName.substring(0, separIndex);
			return fieldName + FIELD_INDEX_SEPARATOR + int(index + 1);
		}

		public static function getBuiltInLinkIdFieldName(fieldName : String, index : int) : String
		{
			var separIndex : int = fieldName.indexOf(FIELD_BUILT_IN_LINK_ID_SEPARATOR);
			if (separIndex > -1)
				fieldName = fieldName.substring(0, separIndex);
			return fieldName + FIELD_BUILT_IN_LINK_ID_SEPARATOR + int(index + 1);
		}

		public static function getBuiltInLinkIdFieldIndex(fieldName : String) : int
		{
			var index : int = fieldName.indexOf(FIELD_BUILT_IN_LINK_ID_SEPARATOR);
			if (index > -1)
			{
				var fieldIndex : int = int(fieldName.substring(fieldName.indexOf(ConfigData.FIELD_BUILT_IN_LINK_ID_SEPARATOR) + ConfigData.FIELD_BUILT_IN_LINK_ID_SEPARATOR.length));
				return fieldIndex - 1;
			}
			return -1;
		}
	}
}
