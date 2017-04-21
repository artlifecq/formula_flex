package com.rpgGame.appModule.jingmai.sub
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.clientConfig.Q_meridian;
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	
	import flash.utils.Dictionary;
	
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	
	import starling.display.DisplayObject;
	import starling.events.TouchEvent;
	
	public class MeridianMap extends SkinUI
	{
		//经脉图id
		private var meridianId:int;
		private var pointHash:HashMap;
		public var pos:int;
		//用来快速查找点击对象
		private var nameDic:Dictionary=new Dictionary();
		public function MeridianMap(skin:StateSkin,mid:int,configList:Array)
		{
			super(skin);
			this.meridianId=mid;
			configList.sort(sortData);
			
			pointHash=new HashMap();
			var len:int=configList.length;
			var tmpPoint:UIAsset;
			var tmpLine:UIAsset;
			var tmpLab:Label;
			var mp:MerdianPoint;
			var key:int;
			var tmpArr:Array;
			for (var i:int = 0; i <len; i++) 
			{
				tmpPoint=_stateSkin["ico_"+(1+i)];
				tmpLine=null;
				if (_stateSkin.hasOwnProperty("l_"+(1+i))) 
				{
					tmpLine=_stateSkin["l_"+(1+i)];
				}
				tmpLab=_stateSkin["lb_"+(1+i)];
				mp=new MerdianPoint(tmpPoint,tmpLine,tmpLab,configList[i].q_meridian_id);
				tmpArr=configList[i].q_meridian_id.split("_");
				key=int(tmpArr[1]);
				nameDic[tmpPoint.name]=mp;
				pointHash.put(key,mp);
			}
			
			this.pivotX=_stateSkin.width/2;
			this.pivotY=_stateSkin.height/2;
			//this.touchGroup=true;
			
		}
		public function showHideLv(bool:Boolean):void
		{
			_stateSkin["grp_label"].visible=bool;
		}
		public function updataServerData(data:Array):void
		{
			if (data) 
			{
				var len:int=data.length;
				var acuData:AcuPointInfo;
				var mp:MerdianPoint;
				for (var i:int = 0; i < len; i++) 
				{
					acuData=data[i];
					mp=pointHash.getValue(acuData.acuPointId);
					if (mp) 
					{
						mp.setData(acuData);
					}
				}
			}
			//设置默认数据
			else
			{
				var points:Array=pointHash.values();
				for each (var p:MerdianPoint in points) 
				{
					p.setData(null);
				}
				
			}
			
			
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if (target&&target.hasOwnProperty("name")) 
			{
				var mp:MerdianPoint=nameDic[target.name];
				if (mp) 
				{
					mp.ClickMe();
				}
			}
		}
		private static function sortData(qA:Q_meridian,qB:Q_meridian):int
		{
			var posA:int=int(qA.q_meridian_id.split("_")[1]);
			var posB:int=int(qB.q_meridian_id.split("_")[1]);
			if (posA<posB) 
			{
				return -1;
			}
			else if(posA>posB)
			{
				return 1;
			}
			return 0;
		}
		
		public function checkForUpdate():void
		{
			// TODO Auto Generated method stub
			var points:Array=pointHash.values();
			for each (var p:MerdianPoint in points)
			{
				p.setData(p.data);
			}
		}
	}
}