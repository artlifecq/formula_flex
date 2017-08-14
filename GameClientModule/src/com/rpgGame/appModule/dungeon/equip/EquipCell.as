package com.rpgGame.appModule.dungeon.equip
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	
	import away3d.events.Event;
	
	import feathers.controls.ButtonState;
	import feathers.controls.UIMovieClip;
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.fuben.FuBenItem_Zhenqi;
	import org.mokylin.skin.app.fuben.mc.UIMovieClipKetiaozhan;
	import org.mokylin.skin.app.fuben.mc.UIMovieClipTiaozhan_dao;
	
	import starling.display.DisplayObject;
	
	public class EquipCell extends DefaultListItemRenderer
	{
		private var _skin:FuBenItem_Zhenqi;
		private var _dailyZoneInfo:DailyZonePanelInfo;
		private var _fistIcon:IconCDFace;
		private var _rewardIcons:Vector.<IconCDFace>;
		private var _data:Q_daily_zone;
		public function EquipCell():void
		{
			super();
		}
		override protected function initialize():void
		{
			_skin = new FuBenItem_Zhenqi();
			_skin.toSprite(this);
			this.setSize(_skin.width,_skin.height);
			_skin.uiJiangli.styleName = "ui/app/fuben/gailvdiaoluo.png"
			_fistIcon = FaceUtil.creatIconCDFaceByUIAsset(_skin.iconFirst,IcoSizeEnum.ICON_64,1,5,5);
			_rewardIcons = new Vector.<IconCDFace>();
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.icon_1,IcoSizeEnum.ICON_48,1,5,5));
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.icon_2,IcoSizeEnum.ICON_48,1,5,5));
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.icon_3,IcoSizeEnum.ICON_48,1,5,5));
			_skin.btnEnter.addEventListener(Event.TRIGGERED,triggeredHandler);
			_skin.btnReset.addEventListener(Event.TRIGGERED,resetHandler);
			EventManager.addEvent(DailyZoneDataManager.UPDATEDAILYZONEINFO,commitData);
			
			_skin.resetgroup.visible = false;
			_skin.combatgroup.visible = false;
		}
		
		override protected function draw():void
		{
			var stateInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_STATE);
			if(stateInvalid)
			{
				refeashState()
			}
			super.draw();
		}
		private function refeashState():void
		{
			if(_dailyZoneInfo==null)
				return ;
			if(_dailyZoneInfo.remainCount<=0)
				return ;
			if(_data.q_limit_level>MainRoleManager.actorInfo.totalStat.level)
				return;
			var display:DisplayObject = _effect;
			if(this._currentState== ButtonState.HOVER)
			{
				_skin.combatgroup.visible = true;
				if(_dailyZoneInfo.havePassed>0)
					_skin.uiTishi.visible=false;
				if(display)
					display.visible = false;
			}else if(this._currentState == ButtonState.UP){
				_skin.combatgroup.visible = false;
				if(_dailyZoneInfo.havePassed>0)
					_skin.uiTishi.visible=true;
				if(display){
					display.visible = true;
					if(_effect!=null)
						_effect.play();
				}
			}
		}
		private function resetHandler(e:Event):void
		{
			if(_dailyZoneInfo==null)
				return ;
			if(_dailyZoneInfo.remainCount==0)
			{
				DailyZoneDataManager.instance().buyCount(_dailyZoneInfo);
			}
		}
		private function triggeredHandler(e:Event):void
		{
			if(_dailyZoneInfo==null)
				return ;
			if(_dailyZoneInfo.remainCount>0)
			{
				DailyZoneDataManager.instance().requestCombat(_dailyZoneInfo);
			}
		}
		override protected function commitData():void
		{
			_data = this.data as Q_daily_zone;
			_dailyZoneInfo = DailyZoneDataManager.instance().getInfoById(_data.q_id);
			_skin.uiName.styleName = "ui/app/fuben/mc/zhuangbei/"+_data.q_limit_level+".png";
			_skin.uiBg.styleName = "ui/big_bg/fuben/zhenqi/"+_data.q_bgicon+".jpg";
			_skin.numZhanli.number = _data.q_combat;
			_skin.uiOk.visible = _dailyZoneInfo.havePassed>0;
			_skin.uiTishi.visible=_dailyZoneInfo.havePassed>0; //加了参数再改
			var itemInfos:Array = ItemUtil.jsonParseItemClientList(_data.q_special_rewards_show);
			FaceUtil.SetItemGrid(_fistIcon,itemInfos[0], true);
			
			itemInfos = ItemUtil.jsonParseItemClientList(_data.q_rewards_client);
			for(var i:int = 0;i<_rewardIcons.length;i++)
			{
				ClientItemInfo(itemInfos[i]).count = 0;
				FaceUtil.SetItemGrid(_rewardIcons[i],itemInfos[i], true);
			}
			
			_skin.uiOk.visible = _dailyZoneInfo.havePassed!=0;
			_skin.lxin1.visible = (1<=_dailyZoneInfo.star);
			_skin.lxin2.visible = (2<=_dailyZoneInfo.star);
			_skin.lxin3.visible = (3<=_dailyZoneInfo.star);			
			
			updatabuttonState();
			refeashOpenState();
			refeashCombatState();
			refeashBuyState();
		}
		private var _effect:UIMovieClip;
		private function updatabuttonState():void
		{
			if(_dailyZoneInfo.remainCount==0)
			{				
				if(_effect!=null)
				{
					this.removeChild(_effect,true);
					_effect = null;
				}
			}
			else{
				if(_data.q_limit_level>MainRoleManager.actorInfo.totalStat.level||_dailyZoneInfo.havePassed>0)
				{
					if(_effect!=null)
					{
						this.removeChild(_effect,true);
						_effect = null;
					}
				}
				else if(_effect==null)
				{
					_effect = new UIMovieClip();
					_effect.autoPlay = true;
					_effect.styleClass = UIMovieClipTiaozhan_dao;
					_effect.x = 0;
					_effect.y = 280;
					this.addChild(_effect);
				}
			}		
		}
		
		private function refeashBuyState():void
		{
			if(_dailyZoneInfo==null||_dailyZoneInfo.remainCount>0)
			{
				_skin.resetgroup.visible = false;
			}else{
				_skin.resetgroup.visible = true;
				_skin.lbYuanbao.text = _dailyZoneInfo.price.toString();
			}
			
		}
		private function refeashCombatState():void
		{
			if(_dailyZoneInfo==null||_dailyZoneInfo.remainCount==0)
			{
				_skin.combatgroup.visible = false;
			}else{
				_skin.lbNum.text = _dailyZoneInfo.remainCount.toString();
			}
		}
		
		private function refeashOpenState():void
		{
			if(_data.q_limit_level>MainRoleManager.actorInfo.totalStat.level)
			{
				_skin.uiLevel.visible = true;
				_skin.grpXin.visible=false;
				_skin.grpXinL.visible=false;
				_skin.uiLevel.styleName = "ui/app/fuben/mc/kaiqidengji/kaiqi_"+_data.q_limit_level+".png";
			}else{
				_skin.uiLevel.visible = false;
				_skin.grpXin.visible=true;
				_skin.grpXinL.visible=true;
			}
		}
		override public function dispose():void
		{
			super.dispose();
			if(_effect!=null)
			{
				_effect.stop();
				this.removeChild(_effect,true);
				_effect = null;
			}
			EventManager.removeEvent(DailyZoneDataManager.UPDATEDAILYZONEINFO,commitData);
		}
		override public function get height():Number
		{
			return _skin.height;
		}
	}
}