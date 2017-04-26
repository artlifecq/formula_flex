package com.rpgGame.core.utils
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import flash.geom.Point;
	
	import cmodule.PreLoader.genv;
	
	import feathers.controls.Label;
	
	import starling.display.DisplayObjectContainer;

	/**
	 *属性显示 
	 * @author yfl
	 * 
	 */	
	public class AttrUtil
	{
		public function AttrUtil()
		{
		}
		public static function showAttr(attHash:HashMap,contianer:DisplayObjectContainer,lab:Label,cellNum:int,startPos:Point,xGe:int,yGe:int,splitStr:String=":"):Array
		{
			var keys:Array=attHash.keys();
			var len:int=keys.length;
			var tmpLab:Label;
			var ret:Array=[];
			var sty:int=startPos.y;
			for (var i:int = 0; i < len; i++) 
			{
				tmpLab=clonelab(lab);
				tmpLab.x=startPos.x+(i%cellNum)*xGe;
				
				startPos.y=sty+int(i/cellNum)*yGe;
				tmpLab.y=startPos.y;
				contianer.addChild(tmpLab);
				tmpLab.text=CharAttributeType.getCNName(keys[i])+splitStr+attHash.getValue(keys[i]);
				ret.push(tmpLab);
			}
			startPos.y=sty+Math.ceil(len/cellNum)*yGe;
			return ret;
		}
		public static function showAttrInSingleLab(attHash:HashMap,lab:Label,devide:String=",",splitStr:String=":"):void
		{
			var keys:Array=attHash.keys();
			var len:int=keys.length;
			var str:String="";
			var ret:Array=[];
			
			for (var i:int = 0; i < len; i++) 
			{
			
				str+=CharAttributeType.getCNName(keys[i])+splitStr+attHash.getValue(keys[i]);
				if (i!=len-1) 
				{
					str+=devide;
				}
			}
			lab.text=str;
		}
		public static function clonelab(lab:Label):Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.name =lab.name;
			temp.letterSpacing = lab.letterSpacing;
			temp.text = lab.text;
			temp.color =lab.color;
			temp.nativeFilters = lab.nativeFilters;
			temp.width = lab.width;
			temp.x = lab.x;
			temp.y = lab.y;
			return temp;
		}
	}
}