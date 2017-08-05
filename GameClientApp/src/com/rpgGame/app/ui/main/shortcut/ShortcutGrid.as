package com.rpgGame.app.ui.main.shortcut
{
	import com.game.engine3D.display.EffectObject3D;
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.view.icon.DragDropGrid;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.utils.GameColorUtil;
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
		private var _playerJod:int;
		/**技能CD时间*/
		private var cdtime:int;
		/**技能消耗资源*/
		private var recoData:Array;
		private var fklnIsOpen:Boolean;
		
		private var renderOk:Boolean=false;
		
		public static const FENGKUANGLIANNU:int=2005;
		public static const NUTA:int=2002;
		private const NUTAMAX:uint=2;//最多弩塔个数
		private static const  tf:TextFormat=new TextFormat(null, 16,0xffff00, true, null, null, null, null, TextFormatAlign.CENTER)
		public function ShortcutGrid(shortcutBar : ShortcutBar, size : int)
		{
			_shortcutBar = shortcutBar;
			super(size);
			init();
		}
		override public function setIsShowCdTm(isShow:Boolean, txtFormat:TextFormat=null):void
		{
			super.setIsShowCdTm(isShow,tf);
		}
		private function init() : void
		{
			imgAutoUse = new UIAsset();
			addChild(imgAutoUse);
			imgAutoUse.x = 4;
			imgAutoUse.y = 4;
//			imgAutoUse.styleName = ClientConfig.getSpellAutoIco();//先注释掉不用自动释放
			setIsShowCdTm(true);
			
			effectSk=new Inter3DContainer();
			effectSk.x = _iconSize/2+4;
			effectSk.y = _iconSize/2+4;
			addChild(effectSk);
			
			/**初始化构建通用特效，只构建一次*/
			goEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_SHANGUANG));
			
			addResEvent();
			
			this.checkDrag=checkDrags;
			
			//_cdFace.showTmTxt(22);
		}
		
		private function checkDrags():Boolean
		{
			return true;
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
		private var nowNuta:int=0;
		private var turnKey:Boolean=false;
		/**设置弩塔转动特效*/
		private function showNutaNumber():void
		{
			if(skillID==NUTA&&playerJod==JobEnum.ROLE_2_TYPE)//疯狂连弩开启是否是墨家    
			{
				var num:int = MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_NU_TA);
				
				if(nowNuta!=num)
				{
					if(num<NUTAMAX)
					{
						if((!turnKey||num>nowNuta)&&nutaEffect!=null)
						{
							nutaEffect.playEffect(1,0.125);
							turnKey=true;
						}
					}
					else
					{
						turnKey=false;
						nutaEffect.stopEffect();
					}
					nowNuta=num;
					updateLabTxt(""+nowNuta);
				}
			}
			else//不是弩塔技能了，值空数字
			{
				nowNuta=-1;
				updateLabTxt("");
				if(nutaEffect!=null)
				{
					nutaEffect.stopEffect();
					turnKey=false;
				}
			}
		}
		private function nutaComplete(target:InterObject3D):void
		{
			turnKey=false;
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
		override public function cdComplete() : void
		{
			if(readyEffect!=null)
			{
				readyEffect.stopEffect();
				cdEffectIsPlay=false;
				_now=0;
			}
			if(!isGary&&!nutaKey)
			{
				//播放cd完成动画
				goEffect.playEffect();
			}
			setGary();
		}
		private var cdEffectIsPlay:Boolean=false;
		private var _now: Number=0;
		override  public function cdUpdate($now : Number, $cdTotal : Number) :void
		{
			
			if (!cdFace || !cdFace.parent)
			{
				addCdFace();
			}
			if(!nutaKey)
			{
				if(cdFace)
				{
					cdFace.updateTimeTxt($now,$cdTotal,true);
				}
				if($cdTotal>_now)
				{
					_now=$now;
					if(/*!cdEffectIsPlay&&*/readyEffect!=null)
					{
						if(!cdEffectIsPlay)
						{
							
						}
						var pac:Number=$now/$cdTotal;
						readyEffect.gotoPercent(pac);
						cdEffectIsPlay=true;
					}
				}
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
		
		
		private var _skillData : Q_skill_model;
		public function upData(shortData : ShortcutsData,skillData : Q_skill_model):void
		{
			_skillData=skillData;
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
			setEffect();
			setJobLab();
			
			renderOk=true;
			setGary();
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
		public function setEffect2Top():void
		{
			this.setChildIndex(effectSk,this.numChildren);
		}
		private var readyEffectJod:int=-1;//当前cd技能框的职业，相同时不用重新生成技能
		/**设置各职业转框特效*/
		public function setEffect():void
		{
            if (playerJod != readyEffectJod && readyEffect) {
                effectSk.removeChild3D(readyEffect);
                readyEffect.dispose();
                readyEffect=null;
            }
			if(playerJod==JobEnum.ROLE_1_TYPE&&playerJod!=readyEffectJod)
			{
				readyEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_BJ));
			}
			else if(playerJod==JobEnum.ROLE_2_TYPE&&playerJod!=readyEffectJod)
			{
				readyEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_MJ));
				if(skillID==FENGKUANGLIANNU)
				{
					liannuEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_FENGKUANGLIANNU));
				}
				else if(skillID==NUTA)
				{
					nutaEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_TANU_MJ),false,nutaComplete);
				}
				
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
			setGary();
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
				addChild(imgAutoUse);
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
			return ;
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
                readyEffect.dispose();
				readyEffect=null;
			}
			if(goEffect!=null)
			{
				effectSk.removeChild3D(goEffect);
                goEffect.dispose();
				goEffect=null;
			}
			if(liannuEffect!=null)
			{
				effectSk.removeChild3D(liannuEffect);
                liannuEffect.dispose();
				liannuEffect=null;
			}
			if(nutaEffect!=null)
			{
				effectSk.removeChild3D(nutaEffect);
                nutaEffect.dispose();
				nutaEffect=null;
			}
		}
		/** 清空 只是把显示数据清除 并不全部销毁 * */
		override public function clear() : void
		{
			showAutoImg(false);
			showAutoEff(false);
			if(readyEffect!=null)
			{
				readyEffect.stopEffect();
				cdEffectIsPlay=false;
				_now=0;
			}
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
			if(labTxt!=null)
			{
				labTxt.numberText =$txt;	
			}
					
		}

		/**角色职业*/
		public function get playerJod():int
		{
			return _playerJod;
		}

		/**
		 * @private
		 */
		public function set playerJod(value:int):void
		{
			_playerJod = value;
		}
		
		/**
		 *因为技能栏的格子是特殊的 
		 * @param posx
		 * @param posy
		 * 
		 */		
		override protected function calIconPos():void
		{
			_iconPositionX=_iconPositionY=3;
			if(_bgImage&&_bgImage.width!=0&&_iconImage&&_iconImage.width!=0){
				_iconPositionX=(_bgImage.width-_iconImage.width)/2;
			}
			if(_bgImage&&_bgImage.height!=0&&_iconImage&&_iconImage.height!=0){
				_iconPositionY=(_bgImage.height-_iconImage.height)/2;
			}
			if(_iconImage){
				_iconImage.x = _iconPositionX;
				_iconImage.y = _iconPositionY;
			}
		}
	}
	
	
	
}
