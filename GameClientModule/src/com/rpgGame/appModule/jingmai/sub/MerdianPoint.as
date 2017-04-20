package com.rpgGame.appModule.jingmai.sub
{
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.meridian.MeridianCfg;
	import com.rpgGame.coreData.clientConfig.Q_meridian;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.FilterUtil;
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import starling.events.Event;

	public class MerdianPoint
	{
		private var imgPoint:UIAsset;
		//有可能是空，没得下一个点的链接了
		private var linkLine:UIAsset;
		private var labAtt:Label;
		private var _data:AcuPointInfo;
		private var _acupointId:String;
		//0 锁定，1，空 2放置了
		private var _state:int;
		private var _imgIcon:UIAsset;
		public function MerdianPoint(point:UIAsset,line:UIAsset,lab:Label,acupoint:String)
		{
			this.imgPoint=point;
			this.imgPoint.touchGroup=true;
			this.linkLine=line;
			this.labAtt=lab;
			this._acupointId=acupoint;
			TipTargetManager.show( imgPoint, TargetTipsMaker.makeTips( TipType.MERIDIAN_TIP, this ) );
			imgPoint.addEventListener(Event.TRIGGERED,onClick);
		}
		
		private function onClick(eve:Event):void
		{
			// TODO Auto Generated method stub
			trace("click");
		}
		public function setData(acp:AcuPointInfo):void
		{
			this._data=acp;
			//有数据说明开启了的
			if (_data&&_data.level>0) 
			{
				this._acupointId=data.MeridId+"_"+data.acuPointId+"_"+data.level;
				var config:Q_meridian=MeridianCfg.getMeridianCfg(acupointId);
				setIcoUrl("ui/app/beibao/icon/"+config.q_huponameurl+".png",28,28);
				if (data.stone.length>0&&config) 
				{
					_state=2;
					this.imgPoint.filter=null;
					
				}
				else
				{
					this.imgPoint.filter=FilterUtil.getGrayFilter();
					_state=1;
				}
			}
			//就是锁定
			else
			{
				this.imgPoint.filter=null;
				_state=0;
				setIcoUrl("ui/app/beibao/icons/suo.png",19,26);
			}
		}
		
		private function setIcoUrl(url:String,w:int=0,h:int=0):void
		{
			
			if (url==""||url==null) 
			{
				if (_imgIcon) 
				{
					_imgIcon.visible=false;
				}
			}
			else
			{
				if (!_imgIcon) 
				{
					_imgIcon=new UIAsset();
					_imgIcon.name="_imgIcon";
					
					this.imgPoint.addChild(_imgIcon);
				}
				_imgIcon.x=(imgPoint.width-w)/2;
				_imgIcon.y=(imgPoint.height-h)/2;
				_imgIcon.styleName=url;
				_imgIcon.visible=true;
			}
		}
		public function get state():int
		{
			return _state;
		}

		public function ClickMe():void
		{
			// TODO Auto Generated method stub
			trace("click me");
		}

		public function get data():AcuPointInfo
		{
			return _data;
		}

		public function get acupointId():String
		{
			return _acupointId;
		}


	}
}