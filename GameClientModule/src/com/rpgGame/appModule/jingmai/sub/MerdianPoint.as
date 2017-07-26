package com.rpgGame.appModule.jingmai.sub
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.manager.MeridianMgr;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.hint.FloatingText;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.MeridianSender;
	import com.rpgGame.appModule.jingmai.MeridianStoneSelectPanelExt;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.view.ui.tip.vo.BaseTipsInfo;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.meridian.MeridianCfg;
	import com.rpgGame.coreData.clientConfig.Q_global;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_meridian;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.FilterUtil;
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.beibao.mc.UIMovieClipBianshi_guang;
	
	import starling.display.DisplayObject;
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
		private var _effect:UIAsset;

		private var _careAcuId:String;
		private var _drawLine:MeridianMapLine;
		private var _tipsInfo:BaseTipsInfo;
		private var _type:int;
		private var _hasReward:Boolean;
		private var _imgBG:UIAsset;
		public function MerdianPoint(bg:UIAsset,point:UIAsset,lab:Label,acupoint:String,mapLine:MeridianMapLine,ptType:int)
		{
			this._imgBG=bg;
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
		//设置节点底框
		private function setIcoBg(isUnLock:Boolean):void
		{
			var config:Q_meridian=MeridianCfg.getMeridianCfg(acupointId);
			if (isUnLock) 
			{
				this._imgBG.styleName="ui/app/beibao/icons/bianxian/"+_data.MeridId+"/liang/"+config.q_stone_type+".png";
			}
			else
			{
				this._imgBG.styleName="ui/app/beibao/icons/bianxian/"+_data.MeridId+"/an/"+config.q_stone_type+".png";
			}
		}
		//设置节点外框
		private function setStoneBg(active:Boolean):void
		{
			var config:Q_meridian=MeridianCfg.getMeridianCfg(acupointId);
			if (1==config.q_showtype) 
			{
				var url:String="ui/app/beibao/icons/kuang/putong/"+config.q_stone_type+".png";
				if (_data.stone.length==0&&active) 
				{
					url="ui/app/beibao/icons/kuang/tuijian/"+config.q_stone_type+".png";
				}
				if (imgPoint.styleName!=url) 
				{
					imgPoint.styleName=url;
				}
			}
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
				
				hasBetter=(config.q_need_level<=MainRoleManager.actorInfo.totalStat.level)&&Mgr.meridianMgr.getBetterStone(config.q_stone_type,_data.stone.length>0?_data.stone[0]:null).length>0;
				//没镶嵌石头置灰
				if (_data.stone.length==0) 
				{
					//setIconFilter(true);
					setIcoUrl("");
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
					var qitem:Q_item=ItemConfig.getQItemByID(_data.stone[0].itemModelId);
					setIcoUrl("ui/app/beibao/icons/bianshi/"+qitem.q_default+"/"+config.q_stone_type+".png",27,27);
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
				setIcoUrl("ui/app/beibao/icons/suo.png",27,19);
			}
			setStoneBg(canActive);
			showLoopEffect(hasBetter);
			setIconFilter(needFilter);
			setIcoBg(labAtt.visible);
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
				
					setIcoUrl("ui/app/beibao/icons/jingmai/weijihuo/"+config.q_huponameurl+".png",23,23);
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
					setIcoUrl("ui/app/beibao/icons/suo.png",27,19);
				}
			}
			else
			{
				setIcoUrl("ui/app/beibao/icons/jingmai/jihuo/"+config.q_huponameurl+".png",23,23);
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
			setIcoBg(labAtt.visible);
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
			_hasReward=bool;
			if (bool) 
			{
				if (!_effect) 
				{
					_effect = new  UIAsset();
					_effect.styleName="ui/common/tubiao/jobup2.png";
					
					_effect.height =14;
					_effect.width = 14;
					_effect.x=(this.imgPoint.width-14);
					_effect.y=2;
				}
				this.imgPoint.addChild(_effect);
			}
			else
			{
				if (_effect) 
				{
					MCUtil.removeSelf(_effect);

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
					var canA:Boolean=Mgr.meridianMgr.getCanActive(_data);
					//没激活
					if (!canA) 
					{
						//
						if (config.q_showtype==0) 
						{
							NoticeManager.showNotifyById(11001,"",[config.q_name]);
						}
						else
						{
							NoticeManager.showNotifyById(11006,"",[config.q_name]);
						}
						return;
					}
					//判断可以升级
					if (config.q_showtype==0) 
					{
						if (_data.level==0) 
						{
							
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
							var items:Vector.<ClientItemInfo>=Mgr.meridianMgr.getBetterStone(config.q_stone_type,data.stone.length>0?data.stone[0]:null);
							if (items.length>0) 
							{
								MeridianStoneSelectPanelExt.setData(items,this);
							}
							else
							{
								if (data.stone.length>0) 
								{
									var isMaxStone:Boolean=ItemConfig.getQItemByID(_data.stone[0].itemModelId).q_levelnum>=MeridianMgr.MAX_STONE_LV;
									if (isMaxStone) 
									{
										FloatingText.showUp("已镶嵌最高等级砭石");
										return;
									}
								}
								AppManager.showApp(AppConstant.JINGMAI_STONE,config.q_stone_type);
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

		public function get hasReward():Boolean
		{
			return _hasReward;
		}

		
	}
}