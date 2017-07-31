package com.rpgGame.core.utils
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.core.interfaces.IAttrShow;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.geom.Point;
	
	import cmodule.PreLoader.genv;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
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
		public static function showAttrByItem(attHash:HashMap,contianer:DisplayObjectContainer,itemc:Class,cellNum:int,startPos:Point,xGe:int,yGe:int,pool:Array=null):Array
		{
			var keys:Array=attHash.keys();
			keys.sort(Array.NUMERIC);
			var len:int=keys.length;
			var tmpLab:*;
			var ret:Array=[];
			var sty:int=startPos.y;
			for (var i:int = 0; i < len; i++) 
			{
				if (pool&&pool.length>0) 
				{
					tmpLab=pool.pop();
				}
				else
				{
					tmpLab=new itemc();
				}
				
				tmpLab.x=startPos.x+(i%cellNum)*xGe;
				
				startPos.y=sty+int(i/cellNum)*yGe;
				tmpLab.y=startPos.y;
				contianer.addChild(tmpLab);
				(tmpLab as IAttrShow).setData(keys[i],attHash.getValue(keys[i]));
				//tmpLab.text=CharAttributeType.getCNName(keys[i])+splitStr+attHash.getValue(keys[i]);
				ret.push(tmpLab);
			}
			startPos.y=sty+Math.ceil(len/cellNum)*yGe;
			return ret;
		}
		public static function showAttr(attHash:HashMap,contianer:DisplayObjectContainer,lab:Label,cellNum:int,startPos:Point,xGe:int,yGe:int,splitStr:String=":",pool:Array=null):Array
		{
			var keys:Array=attHash.keys();
			var len:int=keys.length;
			var tmpLab:Label;
			var ret:Array=[];
			var sty:int=startPos.y;
			for (var i:int = 0; i < len; i++) 
			{
				if (pool&&pool.length>0) 
				{
					tmpLab=pool.pop();
				}
				else
				{
					tmpLab=MCUtil.clonelab(lab);
				}
				
				tmpLab.x=startPos.x+(i%cellNum)*xGe;
				
				startPos.y=sty+int(i/cellNum)*yGe;
				tmpLab.y=startPos.y;
				contianer.addChild(tmpLab);
				tmpLab.htmlText=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_ATTR_NAME,CharAttributeType.getCNName(keys[i])+splitStr)+HtmlTextUtil.getTextColor(GameColorUtil.COLOR_ATTR_VALUE,AttValueConfig.getDisAttValueStr(keys[i],attHash.getValue(keys[i])))
				tmpLab.width=tmpLab.textWidth;				
				ret.push(tmpLab);
			}
			startPos.y=sty+Math.ceil(len/cellNum)*yGe;
			return ret;
		}
		public static function showDiffAttr(attHash:HashMap,contianer:DisplayObjectContainer,lab:Label,cellNum:int,startPos:Point,xGe:int,yGe:int):Array
		{
			var keys:Array=attHash.keys();
			var len:int=keys.length;
			var tmpLab:Label;
			var ret:Array=[];
			var sty:int=startPos.y;
			
			var val:int=0;
			var imgArrow:UIAsset;
			for (var i:int = 0; i < len; i++) 
			{
				tmpLab=MCUtil.clonelab(lab);
				
				
				val=attHash.getValue(keys[i]);
				imgArrow=new UIAsset();
				if (val>=0) 
				{
					imgArrow.styleName="ui/common/tubiao/tu_up.png";
				}
				else if(val<0)
				{
					imgArrow.styleName="ui/common/tubiao/tu_down.png";
				}
				imgArrow.x=startPos.x+(i%cellNum)*xGe;
				startPos.y=sty+int(i/cellNum)*yGe+4;
				imgArrow.y=startPos.y;
				
				contianer.addChild(imgArrow);
				imgArrow.addChild(tmpLab);
				tmpLab.x=12;
				
				tmpLab.text=AttValueConfig.getDisAttValueStr(keys[i],attHash.getValue(keys[i]))+CharAttributeType.getCNName(keys[i]);
				tmpLab.y=(imgArrow.height-tmpLab.height)*0.5;
				ret.push(imgArrow);
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
			
				str+=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_ATTR_NAME,CharAttributeType.getCNName(keys[i]))+splitStr+HtmlTextUtil.getTextColor(GameColorUtil.COLOR_ATTR_VALUE,AttValueConfig.getDisAttValueStr(keys[i],attHash.getValue(keys[i])));
				if (i!=len-1) 
				{
					str+=devide;
				}
			}
			lab.htmlText=str;
		}
	
	}
}