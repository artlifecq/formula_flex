package com.rpgGame.appModule.jingmai.sub
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.sender.MeridianSender;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.meridian.MeridianCfg;
	import com.rpgGame.coreData.clientConfig.Q_meridian;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.EffectUrl;
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
		//0 锁定，1，未激活 2放置了
		private var _state:int;
		private var _imgIcon:UIAsset;
		private var _effect:Inter3DContainer;
		private var _effect3d:InterObject3D;
		public function MerdianPoint(point:UIAsset,line:UIAsset,lab:Label,acupoint:String)
		{
			this.imgPoint=point;
			this.imgPoint.touchGroup=true;
			this.linkLine=line;
			this.labAtt=lab;
			this._acupointId=acupoint;
			TipTargetManager.show( imgPoint, TargetTipsMaker.makeTips( TipType.MERIDIAN_TIP, this ) );
			
		}
		
		public function setData(acp:AcuPointInfo):void
		{
			this._data=acp;
			
			if (_data) 
			{
				this._acupointId=data.MeridId+"_"+data.acuPointId+"_"+data.level;
			}
			var config:Q_meridian=MeridianCfg.getMeridianCfg(acupointId);
			var needEff:Boolean=false;
			//有数据说明开启了的
			if (_data&&_data.level>0) 
			{
				setIcoUrl("ui/app/beibao/icons/icon/bianshi/"+config.q_huponameurl+".png",28,28);
				_state=2;
				this.imgPoint.filter=null;
				if (config.q_showtype==0) 
				{
					var canLevelUp:Boolean=Mgr.meridianMgr.getCanLevelUp(_data);
					if (canLevelUp) 
					{
						needEff=true;
					}
				}
				else
				{
					var addStone:Vector.<ClientItemInfo>=Mgr.meridianMgr.getBetterStone(config.q_stone_type,_data.stone.length>0?_data.stone[0]:null);
					if (addStone.length>0) 
					{
						needEff=true;
					}
				}
			}
			//就是锁定
			else
			{
				//判断是否是未激活
				var canActive:Boolean=Mgr.meridianMgr.getCanActive(_data);
				if (canActive) 
				{
					_state=1;
					setIcoUrl("ui/app/beibao/icons/icon/bianshi/"+config.q_huponameurl+".png",30,32);
				//	this.imgPoint.filter=FilterUtil.getGrayFilter();
					needEff=true;
				}
				else
				{
					this.imgPoint.filter=null;
					_state=0;
					setIcoUrl("ui/app/beibao/icons/suo.png",19,26);
				}
				
			}
			showLoopEffect(needEff);
		}
		public  function showLoopEffect(bool:Boolean):void
		{
			if (bool) 
			{
				if (!_effect) 
				{
					_effect=new Inter3DContainer();
					_effect3d=_effect.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_MERIDIAN_LOOP),this.imgPoint.width/2,this.imgPoint.height/2,0);
					this.imgPoint.addChildAt(_effect,0);
				}
			}
			else
			{
				if (_effect) 
				{
					MCUtil.removeSelf(_effect);
					MCUtil.removeSelf(_effect3d);
					_effect3d.dispose();
					_effect3d=null;
					_effect.dispose();
					_effect=null;
				}
			}
		}
		public function playSuccessEff():void
		{
			var eff:Inter3DContainer=new Inter3DContainer();
			eff.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_MERIDIAN_LOOP),this.imgPoint.width/2,this.imgPoint.height/2,1,function():void
			{
				eff.dispose();
				MCUtil.removeSelf(eff);
			}
			);
			
		}
		private function setIcoUrl(url:String,w:int=0,h:int=0):void
		{
			if (_imgIcon&&_imgIcon.styleName==url) 
			{
				return;
			}
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
			if (_data) 
			{
				var config:Q_meridian=MeridianCfg.getMeridianCfg(this._acupointId);
				if (config) 
				{
					//判断可以升级
					if (config.q_showtype==0) 
					{
						if (_data.level==0) 
						{
							var canA:Boolean=Mgr.meridianMgr.getCanActive(_data);
							if (canA) 
							{
								MeridianSender.reqLevelUpPoint(_data.MeridId,_data.acuPointId);
							}
						}
						else if (Mgr.meridianMgr.getCanLevelUp(_data)) 
						{
							MeridianSender.reqLevelUpPoint(_data.MeridId,_data.acuPointId);
						}
					}
				}
			}
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