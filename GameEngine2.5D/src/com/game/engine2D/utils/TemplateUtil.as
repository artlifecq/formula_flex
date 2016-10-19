package com.game.engine2D.utils
{
	import flash.utils.Dictionary;
	
	/**
	 * 策划配置数据工具类
	 * 用来创建配置数据的索引 
	 * @author fly.liuyang
	 * 
	 */	
	public class TemplateUtil
	{
		/**
		 * 把dic里存储的键提取出来转换为数组 
		 */		
		public static function converDicKeyToArr(dic:Dictionary):Array
		{
			var arr:Array = new Array();
			for (var i:* in dic) 
			{
				arr.push(i);
			}
			return arr;
		}
		
		/**
		 * 把dic里存储的值提取出来转换为数组 
		 */	
		public static function converDicValueToArr(dic:Dictionary):Array
		{
			var arr:Array = new Array();
			for each (var i:* in dic) 
			{
				arr.push(i);
			}
			return arr;
		}
		
		/**
		 * 把array数组转换Dictionary 
		 * @param arr
		 * @param keyName	
		 * @return 
		 * 
		 */		
		public static function converArrToDictionary(arr:*,keyName:String):Dictionary
		{
			var dic:Dictionary = new Dictionary();
			for each (var obj:Object in arr) 
			{
				if(obj.hasOwnProperty(keyName))
				{
					dic[obj[keyName]] = obj;
				}
			}
			return dic;
		}
		
		/**
		 * 把array数组转换Dictionary 
		 * @param arr
		 * @param keyName	
		 * @return 
		 * 
		 */		
		public static function converArrToDictionaryNoKey(arr:*):Dictionary
		{
			var dic:Dictionary = new Dictionary();
			if(arr)
			{
				for each (var obj:* in arr) 
				{
					dic[obj] = obj;
				}
			}
			return dic;
		}
		
		/**
		 * 把Vector数组转换Dictionary 
		 * @param arr
		 * @param keyName	
		 * @return 
		 * 
		 */	
		public static function converVectorToDictionary(arr:*,keyName:String):Dictionary
		{
			var dic:Dictionary = new Dictionary();
			for each (var obj:Object in arr) 
			{
				if(obj.hasOwnProperty(keyName))
				{
					dic[obj[keyName]] = obj;
				}
			}
			return dic;
		}
		
		/**
		 * 创建联合索引 【联合组建】
		 * @param dataDic
		 * @param indexArr
		 * @return 
		 * 
		 */		
		public static function createUniqIndexFromDic(dataDic:Dictionary,indexArr:Array):Dictionary
		{
			return createUniqIndexFromObj(dataDic,indexArr);
		}
		/**
		 * 创建联合索引 【联合组建】
		 * @param dataDic
		 * @param indexArr
		 * @return 
		 * 
		 */		
		public static function createUniqIndexFromArr(dataArr:Array,indexArr:Array):Dictionary
		{
			return createUniqIndexFromObj(dataArr,indexArr);
		}
		/**
		 * 创建联合索引 【联合组建】
		 * @param dataDic
		 * @param indexArr
		 * @return 
		 * 
		 */		
		public static function createUniqIndexFromVec(dataArr:*,indexArr:Array):Dictionary
		{
			return createUniqIndexFromObj(dataArr,indexArr);
		}
		/**
		 * 创建联合索引 【联合组建】
		 * @param dataDic
		 * @param indexArr
		 * @return 
		 * 
		 */		
		private static function createUniqIndexFromObj(dataDic:Object,indexArr:Array):Dictionary
		{
			var indexDic:Dictionary = new Dictionary();
			for each (var obj:Object in dataDic) 
			{
				var valueArr:Array = new Array();
				for each (var attName:String in indexArr) 
				{
					valueArr.push(obj[attName]);
				}
				var keyStr:String = valueArr.join("_");
				var arr:Array = indexDic[keyStr];
				if(arr == null)
				{
					arr = new Array();
					indexDic[keyStr] = arr;
				}
				arr.push(obj);
			}
			return indexDic;
		}
		
		public static function createIndexFromDic(dataDic:Dictionary,indexArr:Array):Dictionary
		{
			return createIndexFromObj(dataDic,indexArr);
		}
		
		public static function createIndexFromArr(dataDic:Array,indexArr:Array):Dictionary
		{
			return createIndexFromObj(dataDic,indexArr);
		}
		
		public static function createIndexFromVec(dataVec:*,indexArr:Array):Dictionary
		{
			return createIndexFromObj(dataVec,indexArr);
		}
		
		private static function createIndexFromObj(dataSource:Object,indexArr:Array):Dictionary
		{
			var indexDic:Dictionary = new Dictionary();
			for each (var dataObj:Object in dataSource) 
			{
				for each (var indexObj:Object in indexArr) 
				{
					if(indexObj is String)
					{
						var dic:Dictionary = indexDic[indexObj];
						if(dic == null)
						{
							dic = new Dictionary();
							indexDic[indexObj] = dic;
						}
						var arr:Array =  dic[dataObj[indexObj]];
						if(arr == null)
						{
							arr = new Array();
							dic[dataObj[indexObj]] = arr;
						}
						arr.push(dataObj);
					}else if(indexObj is Array)//联合索引
					{
						var arrKey:String = (indexObj as Array).join("_");
						var mulitDic:Dictionary = indexDic[arrKey];
						if(mulitDic == null)
						{
							mulitDic = new Dictionary();
							indexDic[arrKey] = mulitDic;
						}
						for each (var subIndexName:Object in indexObj) 
						{
							var mulitArr:Array =  mulitDic[dataObj[subIndexName]];
							if(mulitArr == null)
							{
								mulitArr = new Array();
								mulitDic[dataObj[subIndexName]] = mulitArr;
							}
							mulitArr.push(dataObj);
						}
					}
				}
			}
			return indexDic;
		}
		
		public static function collectKeyToArr(arr:*, keyName:String):Array
		{
			var returnArr:Array = new Array();
			for each (var obj:Object in arr) 
			{
				if(obj.hasOwnProperty(keyName))
				{
					returnArr.push(obj[keyName]);
				}
			}
			return returnArr;
		}
		
		public static function createSimpleIndexFromObj(dataSource:Object,indexStr:String):Dictionary
		{
			var indexDic:Dictionary = new Dictionary();
			for each (var dataObj:Object in dataSource) 
			{
				var indexValue:Object = dataObj[indexStr];
				var arr:Array = indexDic[indexValue];
				if(arr == null)
				{
					arr = new Array();
					indexDic[indexValue] = arr;
				}
				arr.push(dataObj);
			}
			return indexDic;
		}
	}
}