package com.rpgGame.appModule.jingmai.sub
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.IRewardCheck;
	import com.rpgGame.coreData.clientConfig.Q_meridian;
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	public class MeridianMap extends SkinUI implements IRewardCheck
	{
		//经脉图id
		private var meridianId:int;
		private var pointHash:HashMap;
		public var pos:int;
		//用来快速查找点击对象
		private var nameDic:Dictionary=new Dictionary();
		private var linesContianer:Sprite;
		private var _key:String;
		public function MeridianMap(skin:StateSkin,mid:int,configList:Array,nodeKey:String)
		{
			super(skin);
			this._key=nodeKey;
			linesContianer=new Sprite();
			linesContianer.touchable=false;
			this._stateSkin["grp_icondi"].addChildAt(linesContianer,0);
			this.meridianId=mid;
			configList.sort(sortData);
			
			pointHash=new HashMap();
			var len:int=configList.length;
			var tmpPoint:SkinnableContainer;
		
			
			var mp:MerdianPoint;
			var key:int;
			var tmpArr:Array;
			var posA:Array;
			//var next:UIAsset;
			var pre:SkinnableContainer;
			var preConfig:Q_meridian;
			var centerPos:Point;
			var tmpC:Q_meridian;
			var drawLine:MeridianMapLine;
			
			for (var i:int = 0; i <len; i++) 
			{
				tmpPoint=_stateSkin["icd"+(1+i)];
			
				tmpC=configList[i];
				//if (_stateSkin.hasOwnProperty("ico"+(2+i))) 
				if (_stateSkin.hasOwnProperty("icd"+(i))&&i>0) 
				{
					//next=_stateSkin["icd"+(2+i)];
					pre=_stateSkin["icd"+(i)];
					preConfig=configList[i-1];
					//if (next)
					if (pre)
					{
						//posA=[new Point(pointBG.x+24,pointBG.y+24)];
						posA=[new Point(pre.x+24,pre.y+24)];
						//有中间拐点
						//if (tmpC.q_coord!=null&&tmpC.q_coord!="") 
						if (preConfig.q_coord!=null&&preConfig.q_coord!="") 
						{
							//var coodA:Array=tmpC.q_coord.split(",");
							var coodA:Array=preConfig.q_coord.split(",");
							posA.push(new Point(int(coodA[0])+24,int(coodA[1])+24));
						}
						//posA.push(new Point(next.x+24,next.y+24));
						posA.push(new Point(tmpPoint.x+24,tmpPoint.y+24));
						drawLine=new MeridianMapLine("ui/app/beibao/jingmai/line/lang/"+meridianId+".png","ui/app/beibao/jingmai/line/an/"+meridianId+".png",posA);
						linesContianer.addChild(drawLine);
					}
				}
				
				mp=new MerdianPoint(tmpPoint.skin,configList[i].q_meridian_id,drawLine,tmpC.q_showtype);
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
		public function updataServerData(data:Array,playEff:Boolean=false):void
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
						if (playEff) 
						{
							mp.playSuccessEff();
						}
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
			notifyUpdate(_key);
		}
		public function checkCareDataUpdate(acu:AcuPointInfo):void
		{
			if (acu) 
			{
				var points:Array=pointHash.values();
				var key:String=acu.MeridId+"_"+acu.acuPointId;
				for each (var p:MerdianPoint in points)
				{
					if (p.careAcuId==key) 
					{
						p.setData(p.data,true);
					}
				}
				notifyUpdate(_key);
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
			notifyUpdate(_key);
		}
		public function checkForUpdateJX():void
		{
			var points:Array=pointHash.values();
			for each (var p:MerdianPoint in points)
			{
				if (p.type==1) 
				{
					p.setData(p.data);
				}
			}
			notifyUpdate(_key);
		}
		public function hideEffect():void
		{
			// TODO Auto Generated method stub
			var points:Array=pointHash.values();
			for each (var p:MerdianPoint in points)
			{
				p.showLoopEffect(false);
			}
		}
		public  function hasReward():Boolean
		{
			var points:Array=pointHash.values();
			for each (var p:MerdianPoint in points)
			{
				if (p.hasReward) 
				{
					return true;
				}
			}
			return false;
		}
	}
}