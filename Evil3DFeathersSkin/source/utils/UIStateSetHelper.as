package utils
{
	import flash.net.registerClassAlias;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	
	import avmplus.getQualifiedClassName;
	
	import feathers.controls.TextArea;
	import feathers.controls.TextInput;
	import feathers.controls.UIState;

	/**
	 * UI组件设置工具库
	 * @author wewell
	 * 
	 */	
	public class UIStateSetHelper
	{
		/**
		 * 从原生Object对象中复制属性
		 * @param src 数数源对象
		 * @param target 
		 * 
		 */		
		public static function copyProperties(src:Object, target:Object):void{
			var c:String = getQualifiedClassName(src);
			if(c != "Object"){
				parseFromClass(src, target);
				return;
			}
			
			for (var p:* in src){
				if(target.hasOwnProperty(p))
					target[p] = src[p];
			}
		}
		
		//从类实例对象中复制固有属性
		private static function parseFromClass(src:Object, target:Object):void{
			var desc:XML = describeType(target);
			var variable:XMLList = desc.variable;
			for each( var node:XML in variable)
			{
				var name:String = node.@name;
				if (src.hasOwnProperty(name))	
					target[name] = src[ name ]
			}
		}
		
		/**
		 * 深度克隆对象,对象仅包含Int Number String ByteArray Array Dictionary Object Filter及其子类等类型的数据对象
		 * @param obj
		 * @return *
		 * 
		 */		
		public static function clone(obj:*):*
		{
			if(!obj)return null;
			registerClass(getClass(obj));
			if(obj is Array)
			{
				for each(var sub:* in obj)
				{
					if(typeof(sub) is Object)
						registerClass(getClass(sub));
				}
			}
			var bytes:ByteArray = new ByteArray();
			bytes.writeObject(obj);
			bytes.position = 0;
			return bytes.readObject();
		}
		public static function getClass(source:*):Class
		{
			var qname:String = getQualifiedClassName(source);
			var type:Class = Class(getDefinitionByName(qname));
			return type;
		}
		public static function getClassName(source:*):String
		{
			return getQualifiedClassName(source).split("::")[1];
		}
		public static function getClassPath(source:*):String
		{
			return getQualifiedClassName(source).replace("::", ".");
		}
		public static function  registerClass(cls:Class):void
		{
			registerClassAlias(getClassPath(cls), cls);
		}
		
		public static function searchValueInStates(name:String, states:Object, state:String=null):Object
		{
			var obj:Object;
			var sub:Object;
			var rez:Object;
			if(state)
			{
				if(state.indexOf(UIState.LabelStateProptiesKey) != -1)return null;
				for each(sub in states[state])
				{
					if(sub && sub[UIState.NAME] == name)
					{
						return sub[UIState.VALUE];
					}
				}
				return null;
			}
			for (state in states)
			{
				if(state.indexOf(UIState.LabelStateProptiesKey) != -1)continue;
				for each(sub in states[state])
				{
					if(sub && sub[UIState.NAME] == name)
					{
						return sub[UIState.VALUE];
					}
				}
			}
			return null;
		}
		
		/**
		 * 
		 * @param textInput
		 * @param textFormat flash.text.TextFormat
		 */		
		public static function setTextInputFormat(textInput:TextInput, textFormat:TextFormat):void
		{
			textInput.textEditorProperties.textFormat = textFormat;
		}
		
		/**
		 * 
		 * @param TextArea
		 * @param textFormat flash.text.TextFormat
		 */		
		public static function setTextAreaFormat(textArea:TextArea, textFormat:TextFormat):void
		{
			textArea.textEditorProperties.textFormat = textFormat;
		}
		
		public static function copyAnchorLayoutData(src:Object, target:Object, usePadding:Boolean=true):void
		{
				target.left = src.left;
				target.right = src.right;
				target.top = src.top;
				target.bottom = src.bottom;
				target.verticalCenter = src.verticalCenter;
				target.horizontalCenter = src.horizontalCenter;
		}
		
	}
}