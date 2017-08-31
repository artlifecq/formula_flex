package  com.rpgGame.appModule.xinfa.sub
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.manager.MeridianMgr;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.hint.FloatingText;
	import com.rpgGame.app.sender.CheatsSender;
	import com.rpgGame.appModule.jingmai.MeridianStoneSelectPanelExt;
	import com.rpgGame.appModule.jingmai.sub.IStoneSelector;
	import com.rpgGame.appModule.jingmai.sub.MeridianMapLine;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.view.ui.tip.vo.BaseTipsInfo;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.cheats.CheatsCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_cheats;
	import com.rpgGame.coreData.clientConfig.Q_cheats_node;
	import com.rpgGame.coreData.clientConfig.Q_global;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.info.cheats.CheatsNodeVo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.FilterUtil;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.beibao.Xinfa.XinfaIconSkin;
	import org.mokylin.skin.app.beibao.mc.UIMovieClipBianshi_guang;
	
	import starling.display.DisplayObject;
	import starling.filters.FragmentFilter;

	public class CheatsNodePoint extends DynamicTipData implements IStoneSelector
	{
		public static const W:int=48;
		public static const H:int=48;
		private var _GRAY_FILTER:FragmentFilter;
		public var imgPoint:UIAsset;
		//有可能是空，没得下一个点的链接了
	
		private var labAtt:Label;
		private var _data:CheatsNodeVo;
	
	
		private var _imgIcon:UIAsset;
		private var _effect:UIMovieClip;

		private var _careAcuId:String;
		private var _drawLine:Array=[];
		private var _tipsInfo:BaseTipsInfo;
		private var _hasReward:Boolean;
		private var _skin:XinfaIconSkin;
		private var _upArrow:UIAsset;
		public function CheatsNodePoint(s:XinfaIconSkin)
		{
			this._skin=s;
			this.imgPoint=_skin.icok;
			this._skin.container.touchGroup=true;
			
			//this.linkLine.visible=false;
			//
			this.labAtt=_skin.lab;
			this.labAtt.bold=true;
			this._imgIcon=_skin.ico;
			_tipsInfo=TargetTipsMaker.makeTips( TipType.CHEATS_NODE_TIP, this );
			TipTargetManager.show( _skin.container, _tipsInfo);
			
		}
		public function addLine(mapLine:MeridianMapLine):void
		{
			this._drawLine.push(mapLine);
		}
		private function setLineLink(useTween:Boolean):void
		{
			if (_drawLine) 
			{
				var line:MeridianMapLine;
				if (useTween) 
				{
					for each (line in _drawLine) 
					{
						line.tweenDrawInnerLine();
					}
				}
				else
				{
					for each (line in _drawLine) 
					{
						line.drawInner();
					}
				}
			}
		}
		
		//设置节点底框
		private function setIcoBg(isUnLock:Boolean):void
		{
			var config:Q_cheats_node=_data.getConfig();
			var qCheat:Q_cheats=CheatsCfg.getCheats(_data.cheatsId);
			if (isUnLock) 
			{
				this._skin.icod.styleName="ui/app/beibao/icons/bianxian/"+qCheat.q_default+"/liang/"+config.q_stone_type+".png";
			}
			else
			{
				this._skin.icod.styleName="ui/app/beibao/icons/bianxian/"+qCheat.q_default+"/an/"+config.q_stone_type+".png";
			}
			
		}
		//设置节点外框,主要是砭石
		private function setStoneBg(isUnLock:Boolean):void
		{
			if (1==_data.getNodeType()) 
			{
				var config:Q_cheats_node=_data.getConfig();
				var url:String="ui/app/beibao/icons/kuang/putong/"+config.q_stone_type+".png";
				if (isUnLock) 
				{
					url="ui/app/beibao/icons/kuang/tuijian/"+config.q_stone_type+".png";
				}
				if (imgPoint.styleName!=url) 
				{
					imgPoint.styleName=url;
				}
			}
		}
		private function showSubJX(config:Q_cheats_node,useTween:Boolean):void
		{
		
			//setIconFilter(false);
			var hasUnlock:Boolean=Mgr.cheatsMgr.getNodeIsUnlock(_data);
			
			var hasBetter:Boolean;
			if (hasUnlock) 
			{
				this.labAtt.visible=true;
				//setIcoUrl("ui/app/beibao/icons/icon/bianshi/"+config.q_huponameurl+".png",30,32);
				hasBetter=Mgr.meridianMgr.getBetterStone(config.q_stone_type,_data.getStone()).length>0;
				//没镶嵌石头置灰
				if (_data.getStone()==null) 
				{
					//setIconFilter(true);
					labAtt.text="";
					if (hasBetter) 
					{
						labAtt.color=GameColorUtil.C_GREEN;
					}
					else
					{
						labAtt.color=GameColorUtil.C_NORMAL;
					}
					setIcoUrl("");
				}
				else 
				{
					var stoneLv:int=ItemConfig.getItemLevelNum(_data.getStone().itemModelId);
					var qitem:Q_item=ItemConfig.getQItemByID(_data.getStone().itemModelId);
					setIcoUrl("ui/app/beibao/icons/bianshi/"+qitem.q_default+"/"+config.q_stone_type+".png",27,27);
					labAtt.text=stoneLv+"";
					if (hasBetter) 
					{
						labAtt.color=GameColorUtil.C_GREEN;
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
							labAtt.color=GameColorUtil.C_YELLOW;
						}
						else
						{
							labAtt.color=GameColorUtil.C_NORMAL;
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
			showLoopEffect(hasBetter);
			setIcoBg(hasUnlock);
			setStoneBg(hasUnlock);
			//setIconFilter(needFilter);
		}
		private function showSubCX(config:Q_cheats_node,useTween:Boolean):void
		{
			//等级为0，判断激活么得
			var needEff:Boolean=false;
			
			//setIconFilter(false);
			labAtt.visible=true;
			
			var hasUnlock:Boolean=Mgr.cheatsMgr.getNodeIsUnlock(_data);
			if (hasUnlock) 
			{
				if (_data.curLevel==0) 
				{
					setIcoUrl("ui/app/beibao/icons/jingmai/weijihuo/"+config.q_huponameurl+".png",23,23);
				}
				else
				{
					setIcoUrl("ui/app/beibao/icons/jingmai/jihuo/"+config.q_huponameurl+".png",23,23);
				}
				
				//setIconFilter(true);
				//判断能否升级
				labAtt.text=data.curLevel.toString();
				var canLevelUp:Boolean=Mgr.cheatsMgr.getCanLevelUp(_data);
				if (canLevelUp) 
				{
					needEff=true;
					labAtt.color=GameColorUtil.C_GREEN;
				}
				else
				{
					labAtt.color=GameColorUtil.C_NORMAL;
				}
				setLineLink(useTween);
			}
			else
			{
				labAtt.visible=false;
				setIcoUrl("ui/app/beibao/icons/suo.png",27,19);
			}
			showLoopEffect(needEff);
			setIcoBg(hasUnlock);
		}
		public function setData(acp:CheatsNodeVo,useTween:Boolean=false):void
		{
			this._data=acp;
			if (!_data) 
			{
				return;
			}
			
			var config:Q_cheats_node=_data.getConfig();
			this._careAcuId=config.q_need_node_id;
			if (config.q_type==0) 
			{
				showSubCX(config,useTween);
			}
			else
			{
				showSubJX(config,useTween);
			}
			
		}
		public  function showLoopEffect(bool:Boolean):void
		{
			_hasReward=bool;
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
				if (!_upArrow) 
				{
					_upArrow=new UIAsset();
					_upArrow.styleName="ui/common/tubiao/jobup2.png";
					
					_upArrow.height =14;
					_upArrow.width = 14;
					_upArrow.x=(this._skin.icod.width-14);
					_upArrow.y=2;
				}
				_skin.container.addChild(_upArrow);
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
				if (_upArrow) 
				{
					MCUtil.removeSelf(_upArrow);
				}
			}
		}
		public function resumeEffect():void
		{
			if (_effect) 
			{
				_effect.play();
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
			setLineLink(true);
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
			
				_imgIcon.x=(W-w)/2;
				_imgIcon.y=(H-h)/2;
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
				var config:Q_cheats_node=_data.getConfig();
				if (config) 
				{
					var unLock:Boolean=Mgr.cheatsMgr.getNodeIsUnlock(_data);
					//没激活
					if (!unLock) 
					{
						//
						if (config.q_type==0) 
						{
							NoticeManager.showNotifyById(11001,null,[config.q_name]);
						}
						else
						{
							NoticeManager.showNotifyById(11006,null,[config.q_name]);
						}
						return;
					}
					//判断可以升级
					if (config.q_type==0) 
					{
						
						 if (Mgr.cheatsMgr.getCanLevelUp(_data,true)) 
						{
							CheatsSender.reqLevelUpPoint(_data.cheatsId,_data.chetasNodeId);
						}
					}
					//判断能否镶嵌石头
					else
					{
						
						if (config.q_stone_type!=0) 
						{
							var items:Vector.<ClientItemInfo>=Mgr.cheatsMgr.getBetterStone(config.q_stone_type,data.getStone());
							if (items.length>0) 
							{
								MeridianStoneSelectPanelExt.setData(items,this);
							}
							else
							{
								if (data.getStone()!=null) 
								{
									var isMaxStone:Boolean=ItemConfig.getQItemByID(_data.getStone().itemModelId).q_levelnum>=MeridianMgr.MAX_STONE_LV;
									if (isMaxStone) 
									{
										FloatingText.showUp("已镶嵌最高等级砭石");
										return;
									}
								}
								AppManager.showApp(AppConstant.JINGMAI_STONE,_data.getConfig().q_stone_type);
								//NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(7017));
							}
						}
						
					}
				}
			}
		}

		override public function get data():*
		{
			return _data;
		}

	

		public function get careNodeId():String
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
	
		public function getView():DisplayObject
		{
			return this.imgPoint;
		}
		
		public function selectStone(item:long):void
		{
			CheatsSender.reqSetUpPoint(_data.cheatsId,_data.chetasNodeId,item);
		}

		public function get hasReward():Boolean
		{
			return _hasReward;
		}

		
	}
}