package com.rpgGame.app.ui.main.shortcut
{
	import com.game.engine3D.display.EffectObject3D;
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.view.icon.DragDropGrid;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.view.uiComponent.face.NumberBitmap;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.info.shortcuts.ShortcutsData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.EffectUrl;
	
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GlowFilter;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import feathers.controls.UIAsset;
	
	import gs.TimelineLite;
	import gs.TweenMax;
	import gs.easing.Bounce;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.textures.BitmapFontTexture;

	/**
	 * 快捷栏数据
	 * @author luguozheng
	 *
	 */
	public class ShortcutGrid extends DragDropGrid
	{
		private var _shortcutBar : ShortcutBar;
		private var imgAutoUse : UIAsset;
		private var effAutoUse : InterObject3D;
		
		
		
		private var offsetX : int = 315;
		private var offsetY : int = 27;

		private var timeLine:TimelineLite;
		
		private var effectSk:Inter3DContainer;
		private var readyEffect:EffectObject3D;//技能CD转框
		private var goEffect:EffectObject3D;//技能准备好特效
		private var liannuEffect:EffectObject3D;//疯狂连弩开启特效
		private var nutaEffect:EffectObject3D;//弩塔转动，，
		private var labTxt : NumberBitmap; 
		/**技能id*/
		private var skillID:int;
		/**角色职业*/
		private var playerJod:int;
		/**技能CD时间*/
		private var cdtime:int;
		/**技能消耗资源*/
		private var recoData:Array;
		private var fklnIsOpen:Boolean;
		
		private var renderOk:Boolean=false;
		
		public static const FENGKUANGLIANNU:int=2005;
		public static const NUTA:int=2002;
		private const NUTAMAX:uint=2;//最多弩塔个数
		public function ShortcutGrid(shortcutBar : ShortcutBar, size : int)
		{
			_shortcutBar = shortcutBar;
			super(size);
			init();
		}

		private function init() : void
		{
			imgAutoUse = new UIAsset();
			addChild(imgAutoUse);
			imgAutoUse.x = 4;
			imgAutoUse.y = 4;
			imgAutoUse.styleName = ClientConfig.getSpellAutoIco();
			setIsShowCdTm(true);
			effectSk=new Inter3DContainer();
			effectSk.x = _iconSize/2+6;
			effectSk.y = _iconSize/2+6;
			addChild(effectSk);
			
			/**初始化构建通用特效，只构建一次*/
			goEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_SHANGUANG));
			liannuEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_FENGKUANGLIANNU));
			nutaEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_TANU_MJ));
			addResEvent();
			
			//_cdFace.showTmTxt(22);
		}
		
		private function addResEvent():void
		{
			EventManager.addEvent(MainPlayerEvent.NOWMP_CHANGE,mpCHangeHandler);
			EventManager.addEvent(MainPlayerEvent.MAXMP_CHANGE,mpCHangeHandler);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,resChangeHandler);
			EventManager.addEvent(BuffEvent.CHANGE_GRID_BUFF,gridChangeHandler);
		}
		private function removeResEvent():void
		{
			EventManager.removeEvent(MainPlayerEvent.NOWMP_CHANGE,mpCHangeHandler);
			EventManager.removeEvent(MainPlayerEvent.MAXMP_CHANGE,mpCHangeHandler);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,resChangeHandler);
			EventManager.removeEvent(BuffEvent.CHANGE_GRID_BUFF,gridChangeHandler);
		}
		private function resChangeHandler(type:int):void
		{
			setGary();
			
		}
		private function mpCHangeHandler(role:RoleData):void
		{
			setGary();
			
		}
		/**设置疯狂连弩开启关闭图标效果*/
		private function gridChangeHandler(key:Boolean):void
		{
			if(!renderOk)
			{
				return;
			}
			if(playerJod==JobEnum.ROLE_2_TYPE)//疯狂连弩开启是否是墨家        一般其它职业不用收到这个事件
			{
				fklnIsOpen=key;
				if(key)//疯狂连弩开启而
				{
					if(skillID==FENGKUANGLIANNU)
					{
						isGary=false;
						liannuEffect.playEffect();
					}
					else
					{
						isGary=true;
					}
				}
				else//疯狂连弩关闭
				{
					if(skillID==FENGKUANGLIANNU)
					{
						if(liannuEffect)
						{
							liannuEffect.stopEffect();
						}
						
					}
					else
					{
						setGary();
						if(!isGary&&!nutaKey&&goEffect)
						{
							goEffect.playEffect();
							
						}
						
					}
					
					
				}
			}
			
			
			
		}
		/**根据资源设置技能框是否置灰*/
		private function setGary():void
		{
			if(!renderOk)
			{
				return;
			}
			if(fklnIsOpen)
			{
				return;
			}
			
			var nuta:int = MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_NU_TA);
			var nuqi:int = MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_NU_QI);
			var nengliang:int = MainRoleManager.actorInfo.totalStat.getStatValue(CharAttributeType.MP);
			var jingzheng:int = MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_JING_ZHENG);
			
			
			
			showNutaNumber();
			
			if(recoData!=null&&recoData.length>0)
			{
				var i:int,length:int;
				length=recoData.length;
				for(i=0;i<length;i++)
				{
					switch(recoData[i].rt)
					{
						case 100://仇恨
							
							break;
						case 101://血量
							
							break;
						case 102://能量
							if(nengliang>=(-recoData[i].rv))
							{
								isGary=false;
							}
							else
							{
								isGary=true;
								return;
							}
							break;
						case 12://怒气
							if(nuqi>=(-recoData[i].rv))
							{
								isGary=false;
							}
							else
							{
								isGary=true;
								return;
							}
							break;
						case 13://金针
							if(jingzheng>=(-recoData[i].rv))
							{
								isGary=false;
							}
							else
							{
								isGary=true;
								return;
							}
							break;
						case 14://弩塔
							if(nuta>=(-recoData[i].rv))
							{
								isGary=false;
							}
							else
							{
								isGary=true;
								return;
							}
							break;
						
					}
					
					
				}
				
				
			}
			else
			{
				isGary=false;
			}
			
		}
		private var nowNuta:int=-1;
		private var turnKey:Boolean=false;
		/**设置弩塔转动特效*/
		private function showNutaNumber():void
		{
			var num:int = MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_NU_TA);
			
			if(skillID==NUTA&&playerJod==JobEnum.ROLE_2_TYPE)//疯狂连弩开启是否是墨家    
			{
				if(nowNuta!=num)
				{
					nowNuta=num;
					updateLabTxt(""+num);
					if(num<NUTAMAX)
					{
						
						if(!turnKey)//弩塔特效在转的话继续转就是了
						{
							
							nutaEffect.playEffect(0,0.2);
							turnKey=true;
						}
						
						
					}
					else if(num==NUTAMAX)
					{
						if(nutaEffect!=null)
						{
							nutaEffect.stopEffect();
							turnKey=false;
						}
					}
				}
				
			}
			else//不是弩塔技能了，值空数字
			{
				nowNuta=-1;
				updateLabTxt("");
			}
		}
		
		/**设置消耗金针数*/
		private function showJingzhenNumber():void
		{
			if(playerJod==JobEnum.ROLE_4_TYPE)//医家
			{
				if(recoData.length>0)
				{
					var i:int,length:int;
					length=recoData.length;
					for(i=0;i<length;i++)
					{
						if(recoData[i].rt==13)
						{
							updateLabTxt(""+(-recoData[i].rv))
							return;
						}

					}
				}
			}
			
			
		}
		/**继承的父类名字，是cd完的时候调用*/
		override public function removeCDFace() : void
		{
			super.removeCDFace();
			if(readyEffect!=null)
			{
				readyEffect.stop();
			}
			if(!isGary&&!nutaKey)
			{
				//播放cd完成动画
				goEffect.playEffect();
			}
		}
		override  public function cdUpdate($now : Number, $cdTotal : Number) :void
		{
		
			if (!_cdFace || !_cdFace.parent)
			{
				addCdFace();
				
			}
			if(!nutaKey)
			{
				if(_cdFace)
				{
					_cdFace.updateTimeTxt($now,$cdTotal);
				}
				if(readyEffect!=null)
				{
					readyEffect.gotoPercent($now/$cdTotal);
				}
			}
			else
			{
				//_cdFace.updateTimeTxt(100,0);
				//effect3D.gotoPercent(100);
			}
			
		}
		
		private function get nutaKey():Boolean
		{
			/*var nuta:int = MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_NU_TA);
			if(skillID==NUTA&&nuta==2&&(playerJod==2||playerJod==3))//疯狂连弩开启是否是墨家    
			{
				return true;
			}*/
			if(skillID==NUTA)//疯狂连弩开启是否是墨家    
			{
				return true;
			}
			return false;
		}
		
		override  protected function updateIconImagePosition( posx:Number=0, posy:Number=0 ):void
		{
			if(!_iconImage)
				return;
			_iconImage.x = 6;
			_iconImage.y = 6;
		}
		public function upData(shortData : ShortcutsData,skillData : Q_skill_model):void
		{
			playerJod=skillData.q_job;
			if(playerJod==JobEnum.ROLE_3_TYPE)
			{
				playerJod=JobEnum.ROLE_2_TYPE//如果是墨家女就等于墨家男，因为技能框不分男女
			}
			skillID=skillData.q_skillID;
			cdtime=skillData.q_cd;
			
			var recovers:String=skillData.q_recovers;
			var recoObj:Object;
			if(recovers!="")
			{
				recoObj=JSON.parse(recovers);
			}
			
			if(recoObj!=null)
			{
				recoData=recoObj as Array;
			}
			if(recoData==null)
			{
				recoData=new Array();
			}
			setJobLab();
			setEffect();
			renderOk=true;
		}
		/**设置各职业转框特效*/
		public function setJobLab():void
		{	
			if(playerJod==JobEnum.ROLE_2_TYPE)
			{
				showLabTxt(14);
				showNutaNumber();
			}
			else if(playerJod==JobEnum.ROLE_4_TYPE)
			{
				//showLabTxt(10);
				//showJingzhenNumber();
			}
		}
		
		private var readyEffectJod:int=-1;//当前cd技能框的职业，相同时不用重新生成技能
		/**设置各职业转框特效*/
		public function setEffect():void
		{
			//L.l("生成转框特效:"+skillID);
			if(playerJod==JobEnum.ROLE_1_TYPE&&playerJod!=readyEffectJod)
			{
				readyEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_BJ));
			}
			else if(playerJod==JobEnum.ROLE_2_TYPE&&playerJod!=readyEffectJod)
			{
				readyEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_MJ));
				
			}
			else if(playerJod==JobEnum.ROLE_4_TYPE&&playerJod!=readyEffectJod)
			{
				readyEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_YJ));
			}
			
			readyEffectJod=playerJod;
			
		}
		
		public function tweenGrid():void
		{
			if(timeLine){
				timeLine.complete();
			}
			timeLine = new TimelineLite();
			timeLine.append(TweenMax.to(this,0.1,{y:this.y+2,ease:Bounce.easeOut}));
			timeLine.append(TweenMax.to(this,0.1,{y:this.y,ease:Bounce.easeOut,onComplete:onComplete}));	
			
		}
		
		private function onComplete():void
		{
			timeLine=null;
		}

		public function showAutoImg(isShow : Boolean) : void
		{
			imgAutoUse.visible = isShow;
			if (isShow)
			{
				setChildIndex(imgAutoUse, parent.numChildren);
			}
			if(labTxt!=null)
			{
				addChild(labTxt);
			}
			if(effectSk!=null)
			{
				addChild(effectSk);
			}
			
			
		}

		public function showAutoEff(isShow : Boolean) : void
		{
			if (isShow)
			{
				if (!effAutoUse)
				{
					effAutoUse = _shortcutBar.playInter3DAt(ClientConfig.getEffect(EffectUrl.USE_AUTO_SPELL_EFFECT), this.x + offsetX, this.y + offsetY, 0);
				}
			}
			else
			{
				if (effAutoUse)
				{
					_shortcutBar.removeChild3D(effAutoUse);
					effAutoUse = null;
					
				}
			}
		}
		private function removeEffect() : void
		{
			if(readyEffect!=null)
			{
				effectSk.removeChild3D(readyEffect);
				readyEffect=null;
			}
			if(goEffect!=null)
			{
				effectSk.removeChild3D(goEffect);
				goEffect=null;
			}
			if(liannuEffect!=null)
			{
				effectSk.removeChild3D(liannuEffect);
				liannuEffect=null;
			}
			if(nutaEffect!=null)
			{
				effectSk.removeChild3D(nutaEffect);
				nutaEffect=null;
			}
		}
		/** 清空 只是把显示数据清除 并不全部销毁 * */
		override public function clear() : void
		{
			showAutoImg(false);
			showAutoEff(false);
			
			super.clear();
		}
		override public function setGridEmpty() : void
		{
			super.setGridEmpty();
			removeResEvent();
			removeEffect();
			hideLabTxt();
			renderOk=false;
		}
		
		
		public function showLabTxt(size:int) : void
		{
			hideLabTxt();
			if (!labTxt)
			{
				var txtFormat :TextFormat= new TextFormat("SimHei", size, 0xfffbee, true, null, null, null, null, TextFormatAlign.CENTER);
				//txtFormat.letterSpacing=1;
				var texture : BitmapFontTexture = texture = BitmapFontTexture.createBitmapNumberTexture("0.123456789", txtFormat, [new GlowFilter(0x000e07, 1, 2, 2, 15, BitmapFilterQuality.LOW)]);
				
				labTxt = new NumberBitmap(texture);
				//labTxt.numberGap = 1;
				labTxt.x =10;
				labTxt.y =7;
			}
			addChild(labTxt);
			
		}
		public function hideLabTxt() : void
		{
			if (labTxt != null && labTxt.parent != null)
				labTxt.parent.removeChild(labTxt);
			
		}
		public function updateLabTxt($txt:String):void
		{
			labTxt.numberText =$txt;			
		}
	
		
	}
	
	
	
}
