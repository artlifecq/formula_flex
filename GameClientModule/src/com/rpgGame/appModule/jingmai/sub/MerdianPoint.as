package com.rpgGame.appModule.jingmai.sub
{
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.MeridianSender;
	import com.rpgGame.appModule.jingmai.MeridianStoneSelectPanelExt;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.view.ui.hint.FloatingText;
	import com.rpgGame.core.view.ui.tip.vo.BaseTipsInfo;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.meridian.MeridianCfg;
	import com.rpgGame.coreData.clientConfig.Q_global;
	import com.rpgGame.coreData.clientConfig.Q_meridian;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.FilterUtil;
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	
	import flash.utils.setInterval;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	
	import gs.TweenMax;
	
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.beibao.jingmai.mc.UIMovieClipJingmai;
	import org.mokylin.skin.app.beibao.mc.UIMovieClipBianshi_guang;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.filters.FragmentFilter;

	public class MerdianPoint implements IStoneSelector
	{
		private var _GRAY_FILTER:FragmentFilter;
		public var imgPoint:UIAsset;
		//有可能是空，没得下一个点的链接了
	
		private var labAtt:Label;
		private var _data:AcuPointInfo;
		private var _acupointId:String;
	
		private var _imgIcon:UIAsset;
		private var _effect:UIMovieClip;

		private var _careAcuId:String;
		private var _drawLine:MeridianMapLine;
		private var _tipsInfo:BaseTipsInfo;
		private var _type:int;
		public function MerdianPoint(point:UIAsset,lab:Label,acupoint:String,mapLine:MeridianMapLine,ptType:int)
		{
			this._type=ptType;
			this.imgPoint=point;
			this.imgPoint.touchGroup=true;
			
			//this.linkLine.visible=false;
			//
			this.labAtt=lab;
			this._acupointId=acupoint;
			this._drawLine=mapLine;
			_tipsInfo=TargetTipsMaker.makeTips( TipType.MERIDIAN_TIP, this );
			TipTargetManager.show( imgPoint, _tipsInfo);
			
		}
		private function setLineLink(useTween:Boolean):void
		{
			if (_drawLine) 
			{
				if (useTween) 
				{
					_drawLine.tweenDrawInnerLine();
				}
				else
				{
					_drawLine.drawInner();
				}
			}
		}
		private function showSubJX(config:Q_meridian,useTween:Boolean):void
		{
			var needFilter:Boolean=false;
			//setIconFilter(false);
			var canActive:Boolean=_data.stone.length>0||Mgr.meridianMgr.getCanActive(_data);
			var hasBetter:Boolean;
			if (canActive) 
			{
				this.labAtt.visible=true;
				setIcoUrl("ui/app/beibao/icons/icon/bianshi/"+config.q_huponameurl+".png",30,32);
				hasBetter=Mgr.meridianMgr.getBetterStone(config.q_stone_type,_data.stone.length>0?_data.stone[0]:null).length>0;
				//没镶嵌石头置灰
				if (_data.stone.length==0) 
				{
					//setIconFilter(true);
					needFilter=true;
					labAtt.text="0";
					if (hasBetter) 
					{
						labAtt.color=GameColorUtil.COLOR_GREEN;
					}
					else
					{
						labAtt.color=GameColorUtil.COLOR_GRAY;
					}
				}
				else 
				{
					var stoneLv:int=ItemConfig.getItemLevelNum(_data.stone[0].itemModelId);
					labAtt.text=stoneLv+"";
					if (hasBetter) 
					{
						labAtt.color=GameColorUtil.COLOR_GREEN;
					}
					else
					{
						var qConfig:Q_global=GlobalSheetData.getSettingInfo(505);
						var maxStoneLv:int=100;
						if (qConfig) 
						{
							maxStoneLv=qConfig.q_int_value;
						}
						if (stoneLv>=maxStoneLv) 
						{
							labAtt.color=GameColorUtil.COLOR_YELLOW;
						}
						else
						{
							labAtt.color=GameColorUtil.COLOR_NORMAL;
						}
					}
				}
				setLineLink(useTween);
			}
			//没激活就是锁
			else
			{
				this.labAtt.visible=false;
				setIcoUrl("ui/app/beibao/icons/suo.png",19,26);
			}
			showLoopEffect(hasBetter);
			setIconFilter(needFilter);
		}
		private function showSubCX(config:Q_meridian,useTween:Boolean):void
		{
			//等级为0，判断激活么得
			var needEff:Boolean=false;
			var needFilter:Boolean=false;
			//setIconFilter(false);
			labAtt.visible=true;
			labAtt.text=_data.level+"";
			if (_data.level==0)
			{
				
				//如果是奇穴判断能否镶嵌石头，如果镶嵌了说明解锁过l
				var canActive:Boolean=Mgr.meridianMgr.getCanActive(_data);
				//解锁了
				if (canActive) 
				{
				
					setIcoUrl("ui/app/beibao/icons/icon/bianshi/"+config.q_huponameurl+".png",30,32);
					//setIconFilter(true);
					needFilter=true;
					//判断能否升级
					var canLevelUp:Boolean=Mgr.meridianMgr.getCanLevelUp(_data);
					if (canLevelUp) 
					{
						needEff=true;
						labAtt.color=GameColorUtil.COLOR_GREEN;
					}
					else
					{
						labAtt.color=GameColorUtil.COLOR_NORMAL;
					}
					setLineLink(useTween);
				}
				//锁定状态
				else
				{
					labAtt.visible=false;
					setIcoUrl("ui/app/beibao/icons/suo.png",19,26);
				}
			}
			else
			{
				setIcoUrl("ui/app/beibao/icons/icon/bianshi/"+config.q_huponameurl+".png",28,28);
				needEff=Mgr.meridianMgr.getCanLevelUp(_data);
				if (needEff) 
				{
					labAtt.color=GameColorUtil.COLOR_GREEN;
				}
				else
				{
					var isMax:Boolean=Mgr.meridianMgr.isMaxAcuLevel(_data);
					if (isMax) 
					{
						labAtt.color=GameColorUtil.COLOR_YELLOW;
					}
					else
					{
						labAtt.color=GameColorUtil.COLOR_NORMAL;
					}
				}
				setLineLink(useTween);
			}
			showLoopEffect(needEff);
			setIconFilter(needFilter);
		}
		public function setData(acp:AcuPointInfo,useTween:Boolean=false):void
		{
			this._data=acp;
			if (!_data) 
			{
				return;
			}
			if (_data) 
			{
				this._acupointId=data.MeridId+"_"+data.acuPointId+"_"+data.level;
			}
			var config:Q_meridian=MeridianCfg.getMeridianCfg(acupointId);
			this._careAcuId=config.q_need_meridian_id;
			if (config.q_showtype==0) 
			{
				showSubCX(config,useTween);
			}
			else
			{
				showSubJX(config,useTween);
			}
		}
		private function setIconFilter(bool:Boolean):void
		{
			if (_imgIcon) 
			{
				if (bool) 
				{
					if (_imgIcon.filter==null) 
					{
						_imgIcon.filter=GRAY_FILTER;
					}
				}
				else
				{
					if (_imgIcon.filter!=null) 
					{
						_imgIcon.filter=null;
					}
					
				}
			}
		}
		public  function showLoopEffect(bool:Boolean):void
		{
			if (bool) 
			{
				if (!_effect) 
				{
					_effect = new feathers.controls.UIMovieClip();
				
					_effect.name = "mc_bianshi";
					_effect.autoPlay = false;
					_effect.height = 64;
					_effect.styleClass = UIMovieClipBianshi_guang;
					_effect.width = 64;
					_effect.x=(this.imgPoint.width-64)/2;
					_effect.y=(this.imgPoint.height-64)/2;
					_effect.play();
					this.imgPoint.addChild(_effect);
				}
			}
			else
			{
				if (_effect) 
				{
					MCUtil.removeSelf(_effect);
					_effect.stop();
					_effect.dispose();
					_effect=null;
				}
			}
		}
		private function addEft(render:RenderUnit3D):void
		{
			render.play(0);
		}
		public function playSuccessEff():void
		{
			var eff:Inter3DContainer=new Inter3DContainer();
			this.imgPoint.addChild(eff);
			eff.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_MERIDIAN_LEVELUP),this.imgPoint.width/2,this.imgPoint.height/2,1,function():void
			{
				eff.dispose();
				MCUtil.removeSelf(eff);
			}
			,addEft);
			
//			if (linkLine) 
//			{
//				TweenMax.to(this.linkLine,0.6,{autoAlpha:1});
//			}
			if (_drawLine) 
			{
				_drawLine.tweenDrawInnerLine();
			}
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
				_imgIcon.width=w;
				_imgIcon.height=h;
				_imgIcon.visible=true;
			}
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
							//没激活
							if (!canA) 
							{
								//
								return;
								//MeridianSender.reqLevelUpPoint(_data.MeridId,_data.acuPointId);
							}
						}
						 if (Mgr.meridianMgr.getCanLevelUp(_data,true)) 
						{
							MeridianSender.reqLevelUpPoint(_data.MeridId,_data.acuPointId);
						}
					}
					//判断能否镶嵌石头
					else
					{
						if (config.q_need_level>MainRoleManager.actorInfo.totalStat.level) 
						{
							NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(7016),[config.q_need_level]);
							return;
						}
						if (config.q_stone_type!=0) 
						{
							var items:Vector.<ClientItemInfo>=Mgr.meridianMgr.getBetterStone(config.q_stone_type);
							if (items.length>0) 
							{
								MeridianStoneSelectPanelExt.setData(items,this);
							}
							else
							{
								AppManager.showApp(AppConstant.JINGMAI_STONE);
								//NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(7017));
							}
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

		public function get careAcuId():String
		{
			return _careAcuId;
		}

		public function get GRAY_FILTER():FragmentFilter
		{
			if (_GRAY_FILTER==null) 
			{
				_GRAY_FILTER=FilterUtil.getGrayFilter();
			}
			return _GRAY_FILTER;
		}
		/**
		 *0冲穴，1奇穴 
		 * @return 
		 * 
		 */
		public function get type():int
		{
			return _type;
		}
		public function getView():DisplayObject
		{
			return this.imgPoint;
		}
		
		public function selectStone(item:long):void
		{
			MeridianSender.reqSetUpPoint(data.MeridId,data.acuPointId,item);
		}
		
	}
}