package com.editor.core
{

	public class CodeTemplet
	{
		public static var settingSourceStr : String = <![CDATA[package #package#
{
	/**
	* 
	*  根据clientres\res\config\Settint.txt 文件设置自动生成的代码
	*	
	* 【**不可手动修改此类**】，
	*	
	* 【任何修改都将被生成工具覆盖，如需修改请直接修改clientres\res\config\Settint.txt文件】
	* @author NEIL
	* 
	*/
	public class #className#
	{
#attrName#
	}
}
		]]>;

		public static var configSourceStr : String = <![CDATA[package #package#
{
	/**
	* 
	*  根据模块config 文件设置自动生成的代码
	*	
	* 【**不可手动修改此类**】，
	*	
	* 【任何修改都将被生成工具覆盖，如需修改请直接修改具体的config文件】
	* @author NEIL
	* 
	*/
	public class #className#
	{
#attrName#
	}
}
		]]>;

		public static var configSourceStrWithBytes : String = <![CDATA[package #package#
{
	import flash.utils.ByteArray;

	/**
	* 
	*  根据模块config 文件设置自动生成的代码
	*	
	* 【**不可手动修改此类**】，
	*	
	* 【任何修改都将被生成工具覆盖，如需修改请直接修改具体的config文件】
	* @author NEIL
	*/
	public class #className#
	{
#attrName#
	}
}
		]]>;

		public static var registerSourceStr : String = <![CDATA[package #package#
{
	import flash.net.registerClassAlias;
	import org.client.mainCore.ds.HashMap;
	/**
	* 
	*  根据模块config 文件设置自动生成的代码
	*	
	* 【**不可手动修改此类**】，
	*	
	* 【任何修改都将被生成工具覆盖，如需修改请直接修改具体的config文件】
	* @author NEIL
	*/
	public class ConfigClassRegister
	{
		private static var _classMap:HashMap = new HashMap();
		#regAttrStr#
		public static function setup():void
		{
#attrName#
		}
		private static function regClass(name:String, cls:Class):void
		{
			_classMap.add(name,cls);
			registerClassAlias(name, cls);
		}
		public static function getClass(name:String):Class
		{
			return _classMap.getValue(name);
		}
	}
}
		]]>;

		public function CodeTemplet()
		{
		}
	}
}
