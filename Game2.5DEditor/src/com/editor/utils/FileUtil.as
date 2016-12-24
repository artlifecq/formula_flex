package com.editor.utils
{
	import com.editor.cfg.ConfigData;
	import com.editor.data.ConfigDesc;

	import flash.events.FileListEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.system.Capabilities;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	import org.client.mainCore.utils.Delegate;

	/**
	 *
	 * 文件工具类
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-17 上午10:30:12
	 *
	 */
	public class FileUtil
	{
		public function FileUtil()
		{
		}

		public static function readFile(file : File) : ByteArray
		{
			var fs : FileStream = new FileStream();
			fs.open(file, FileMode.READ);
			var bytes : ByteArray = new ByteArray();
			fs.readBytes(bytes);
			fs.close();
			return bytes;
		}

		public static function readTextFile(file : File) : String
		{
			var fs : FileStream = new FileStream();
			fs.open(file, FileMode.READ);
			var bytes : ByteArray = new ByteArray();
			fs.readBytes(bytes);
			fs.close();
			var charSet : String = getFileType(bytes);
			bytes.position = 0;
			var result : String = bytes.readMultiByte(bytes.bytesAvailable, charSet);
			return result;
		}

		private static function getFileType(fileData : ByteArray) : String
		{
			fileData.position = 0;
			var b0 : int = fileData.readUnsignedByte();
			var b1 : int = fileData.readUnsignedByte();
			var fileType : String = "ANSI"; //"GB2312"
			if (b0 == 0xFF && b1 == 0xFE)
				fileType = "Unicode";
			else if (b0 == 0xFE && b1 == 0xFF)
				fileType = "Unicode big endian";
			else if (b0 == 0xEF && b1 == 0xBB)
				fileType = "UTF-8";
			return fileType;
		}

		public static function writeToFile(nativePath : String, value : Object, charSet : String = "utf-8") : void
		{
			var file : File = new File(nativePath);
			var bytes : ByteArray = new ByteArray();
			if (value is Array)
			{
				bytes.writeObject(value);
			}
			else if (value is String)
			{
				bytes.writeMultiByte(value as String, charSet);
			}
			else if (value is XML)
			{
				bytes.writeMultiByte((value as XML).toXMLString(), charSet);
			}
			else if (value is ByteArray)
			{
				(value as ByteArray).position = 0;
				bytes.writeBytes((value as ByteArray), 0, (value as ByteArray).length);
			}
			else if (value is int)
			{
				bytes.writeInt(value as int);
			}
			else if (value is Number)
			{
				bytes.writeFloat(value as Number);
			}
			else if (value is uint)
			{
				bytes.writeUnsignedInt(value as uint);
			}
			else
			{
				bytes.writeObject(value);
			}
			var stream : FileStream = new FileStream();
			stream.open(file, FileMode.WRITE);
			stream.writeBytes(bytes, 0, bytes.length);
			stream.close();
			bytes.clear();
			bytes = null;
		}

		public static function pathValid(nativePath : String) : Boolean
		{
			if (nativePath && (nativePath.indexOf(":") == 1 || nativePath.indexOf("/") == 0))
				return true;
			return false;
		}

		public static function isMacOS() : Boolean
		{
			return Capabilities.os.substr(0, 3) == "Mac";
		}

		public static function getDirectoryFiles(nativePath : String, extension : String = null, isAsync : Boolean = false, currAsyncComplete : Function = null, allAsyncComplete : Function = null) : Dictionary
		{
			var filesDic : Dictionary = new Dictionary();
			var fileDire : File = new File(nativePath);
			if (fileDire.exists)
			{
				if (isAsync)
				{
					fileDire.addEventListener(FileListEvent.DIRECTORY_LISTING, Delegate.create(addToDirectoryFiles, filesDic, null, extension, isAsync, currAsyncComplete));
					fileDire.getDirectoryListingAsync();
				}
				else
				{
					var list : Array = fileDire.getDirectoryListing();
					addToDirectoryFiles(null, filesDic, list, extension, isAsync, currAsyncComplete);
				}
			}
			return filesDic;
		}

		private static function addToDirectoryFiles(event : FileListEvent, filesDic : Dictionary, list : Array, extension : String, isAsync : Boolean, currAsyncComplete : Function) : void
		{
			if (event)
			{
				(event.target as File).removeEventListener(FileListEvent.DIRECTORY_LISTING, Delegate.create(addToDirectoryFiles));
				list = event.files;
			}
			list.sortOn("nativePath", Array.CASEINSENSITIVE);
			var len : int = list.length;
			for (var i : int = 0; i < len; i++)
			{
				var file : File = list[i];
				if (file.isDirectory)
				{
					var dict : Dictionary = getDirectoryFiles(file.nativePath, extension, isAsync, currAsyncComplete);
					for (var path : String in dict)
						filesDic[path] = dict[path];
				}
				else
				{
					var files : Array = filesDic[file.parent.nativePath];
					if (!files)
					{
						files = [];
						filesDic[file.parent.nativePath] = files;
					}
					if (extension)
					{
						var exts : Array = extension.split(";");
						for each (var ext : String in exts)
						{
							if (ext && file.extension && file.extension.toLowerCase() == ext)
							{
								files.push(file);
							}
						}
					}
					else
					{
						files.push(file);
					}
				}
			}
			if (currAsyncComplete != null)
			{
				currAsyncComplete(list);
			}
		}

		public static function parseTextData(txt : String, dataClass : Class, desc : ConfigDesc) : String
		{
			var errorInfo : String = "";
			if (!txt)
			{
				errorInfo = "数据为空";
				return errorInfo;
			}
			var fieldDescs : Array = [];
			var lineStrs : Array = txt.split("\r\n");
			if (!lineStrs || lineStrs.length < 2)
				lineStrs = txt.split("\r");
			if (lineStrs && lineStrs.length > 0)
			{
				var pattern : RegExp;
				var isFields : Boolean = false;
				while (lineStrs.length > 0 && !isFields)
				{
					var isValid : Boolean = true;
					var headerDescs : Array = lineStrs[0].split("\t");
					if (headerDescs[0])
					{
						for (var r : int = 0; r < headerDescs.length; r++)
						{
							var headerStr : String = headerDescs[r];
							if (headerStr)
							{
								pattern = /^[A-Za-z0-9_]+$/;
								var result : Object = pattern.exec(headerStr.split("#")[0]);
								if (!result)
								{
									isValid = false;
									break;
								}
							}
						}
					}
					else
					{
						isValid = false;
					}
					if (isValid)
					{
						isFields = true;
					}
					else
					{
						headerDescs = lineStrs.shift().split("\t");

						fieldDescs.push(headerDescs);
						for (var t : int = 0; t < headerDescs.length; t++)
						{
							var headerDesc : String = headerDescs[t];
							desc.fieldDescs.push(headerDesc);
						}
					}
				}
			}
			if (lineStrs && lineStrs.length > 0)
			{
				var field : String;
				var fieldSplit : Array;
				var tempFields : Array = lineStrs.shift().split("\t");
				var majorKey : String = tempFields[0];
				var hasId : Boolean = false;
				for (var k : int = 0; k < tempFields.length; k++)
				{
					var fieldHead : String = tempFields[k];
					fieldSplit = fieldHead.split("#");
					field = fieldSplit[0];
					field = field.replace(/\"/g, "");
					desc.addField(fieldHead, field);
					if (field == "id" || field.indexOf("id#") != -1)
						hasId = true;
				}

				var tipsInited : Boolean = false;
				var internalId : int = -1;
				if (!hasId)
					internalId = 0;
				var rows : int = lineStrs.length;
				for (var i : int = 0; i < rows; i++)
				{
					var linrStr : String = String(lineStrs[i]);
					pattern = /(^\s*)|(\s*$)/;
					var lineResult : String = linrStr.replace(pattern, "");
					if (!lineResult)
						continue;

					var description : Array = linrStr.split("\t");
					var data : Object = new dataClass();
					if (internalId > -1)
						internalId++;

					if (desc.majorKey)
					{
						if (internalId > -1)
							data.id = internalId;

						if (data is ConfigData)
						{
							(data as ConfigData).majorKey = desc.majorKey;
							(data as ConfigData).tabelName = desc.tabelName;
							(data as ConfigData).init();
						}
					}

					for (var j : int = 0; j < tempFields.length; j++)
					{
						var value : String = description[j];
						if (!value || value == "undefined")
							value = "";
						field = tempFields[j];
						if (!field)
							continue;
						fieldSplit = field.split("#");
						field = fieldSplit[0];
						field = field.replace(/\"/g, "");
						pattern = /^[A-Za-z0-9_]+$/;
						var fieldResult : Object = pattern.exec(field);
						if (!fieldResult)
						{
							errorInfo += "无效的字段名：" + field + "；";
							continue;
						}

						field = desc.getPropertyFieldName(field, j);
						if (!tipsInited)
						{
							var tipsStr : String = "";
							for each (var rowDescs : Array in fieldDescs)
							{
								if (j < rowDescs.length)
								{
									if (tipsStr)
										tipsStr += "\r\n" + rowDescs[j];
									else
										tipsStr += rowDescs[j];
								}
							}

							if (tipsStr.indexOf("#") != -1)
								desc.fieldLabels[field] = tipsStr.split("#")[0];

							if (tipsStr.indexOf("#") != -1)
								desc.fieldTips[field] = tipsStr.split("#")[1];
							else
								desc.fieldTips[field] = tipsStr;
						}
						var fieldType : String = fieldSplit[1];
						if (fieldType)
							fieldType = fieldType.toLowerCase();
						if (fieldType == "string")
						{
							if (data is ConfigData)
								(data as ConfigData).setValue(field, String(value), false);
							else
								data[field] = String(value);
						}
						else if (fieldType == "int")
						{
							if (data is ConfigData)
								(data as ConfigData).setValue(field, int(value), false);
							else
								data[field] = int(value);
						}
						else if (fieldType == "number")
						{
							if (data is ConfigData)
								(data as ConfigData).setValue(field, Number(value), false);
							else
								data[field] = Number(value);
						}
						else if (fieldType == "boolean")
						{
							if (data is ConfigData)
								(data as ConfigData).setValue(field, value == "1" ? true : false, false);
							else
								data[field] = value == "1" ? true : false;
						}
						else if (fieldType == "class")
						{
							if (data is ConfigData)
								(data as ConfigData).setValue(field, null, false);
							else
								data[field] = null;
						}
						else if (fieldType == "bytearray")
						{
							var nums : Array = value.split(",");
							var numLen : int = nums.length;
							var numBytes : ByteArray = new ByteArray();
							for (var n : int = 0; n < numLen; n++)
							{
								numBytes.writeInt(int(nums[n]));
							}
							if (data is ConfigData)
								(data as ConfigData).setValue(field, numBytes, false);
							else
								data[field] = numBytes;
						}
						else if (fieldType == "array")
						{
							var values : Array = value.split("|");
							var valueLen : int = values.length;
							var valuesArr : Array = [];
							for (var m : int = 0; m < valueLen; m++)
							{
								valuesArr.push(values[m]);
							}
							if (data is ConfigData)
								(data as ConfigData).setValue(field, valuesArr, false);
							else
								data[field] = valuesArr;
						}
						else
						{
							if (data is ConfigData)
								(data as ConfigData).setValue(field, value, false);
							else
								data[field] = value;
						}

						if (!desc.values.hasOwnProperty(field))
							desc.values[field] = new Dictionary();
						desc.values[field][data.id] = value;
					}
					tipsInited = true;

					if (internalId > -1)
					{
						desc.cacheDic[internalId] = data;
						if (internalId > desc.uid)
							desc.uid = internalId;
					}
					else
					{
						desc.cacheDic[data.id] = data;
						if (data.id > desc.uid)
							desc.uid = data.id;
					}
					if (data is ConfigData)
						(data as ConfigData).inited();
				}
			}
			else
			{
				errorInfo = "数据异常";
				return errorInfo;
			}
			return errorInfo;
		}

		public static function getTextDataFromDatas(desc : ConfigDesc) : String
		{
			var caches : Dictionary = desc.cacheDic;
			var data : String = "";
			var len : int = desc.fieldDescs.length;
			var i : int;
			var key : String;
			for (i = 0; i < len; i++)
			{
				key = desc.fieldDescs[i];
				data += key;
				if (i + 1 < len)
					data += "\t";
			}
			data += "\r\n";
			len = desc.getFieldCount();
			for (i = 0; i < len; i++)
			{
				key = desc.getFieldHead(i);
				data += key;
				if (i + 1 < len)
					data += "\t";
			}
			var cacheDatas : Array = dictToArray(caches);
			sortDatas(cacheDatas);

			for each (var cacheData : Object in cacheDatas)
			{
				data += "\r\n";
				for (i = 0; i < len; i++)
				{
					key = desc.getField(i);
					var field : String = key;
					field = field.split("#")[0];
					field = desc.getPropertyFieldName(field, i);

					try
					{
						var value : Object = null;
						if (cacheData.hasOwnProperty(field))
						{
							value = cacheData[field];
						}
						else
						{
							value = desc.values[field];
							if (value)
								value = value[cacheData.id];
						}
						if (value is Boolean)
						{
							if (value)
								value = "1";
							else
								value = "";
						}
						if (!value || value == "undefined")
							value = "";
						data += value;
						if (i + 1 < len)
							data += "\t";
					}
					catch (e : Error)
					{
						throw e;
					}
				}
			}
			return data;
		}

		public static function dictToArray(dict : Dictionary) : Array
		{
			var datas : Array = [];
			var data : Object;
			for each (data in dict)
			{
				datas.push(data);
			}
			return datas;
		}

		public static function sortDatas(datas : Object, desc : Boolean = false) : void
		{
			if (datas is Array || datas is Vector)
			{
				if (desc)
				{
					datas.sort(function(a : Object, b : Object) : Number
					{
						if (a && b)
						{
							if (a.id < 0)
							{
								if (a.id < b.id)
									return 1;
								else
									return -1;
							}
							else if (a.id > 0)
							{
								if (a.id < b.id)
									return -1;
								else
									return 1;
							}
						}
						return 0;
					});
				}
				else
				{
					datas.sort(function(a : Object, b : Object) : Number
					{
						if (a && b)
						{
							if (a.id > 0)
							{
								if (a.id > b.id)
									return 1;
								else
									return -1;
							}
							else if (a.id < 0)
							{
								if (a.id > b.id)
									return -1;
								else
									return 1;
							}
						}
						return 0;
					});
				}
			}
		}

		public static function fileExists(path : String) : Boolean
		{
			path = path.replace("file://", "");
			if (!pathValid(path))
				return false;
			var file : File = new File(path);
			return file.exists;
		}
		//文件合法性验证
		private static var fileNameReg : RegExp = /^[A-Za-z\d-.\/-_]+$/;

		//只能是，字母，数字，下划线，横线其中的字符组成， 其他字符全为非法字符， 即 a-z ,A-Z,0-9, _ -  组成
		public static function checkFileName(localPath : String) : Boolean
		{
			return fileNameReg.test(localPath);
		}
	}
}
