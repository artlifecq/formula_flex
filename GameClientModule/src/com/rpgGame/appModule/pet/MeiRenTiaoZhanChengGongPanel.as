package com.rpgGame.appModule.pet
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.sender.HuBaoSender;
	import com.rpgGame.app.sender.PetSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.pet.sub.PetZoneBall;
	import com.rpgGame.coreData.cfg.PetCfg;
	import com.rpgGame.coreData.clientConfig.Q_girl_pet;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.netData.pet.bean.PetInfo;
	import com.rpgGame.netData.pet.message.ResPetZoneResultMessage;
	
	import flash.events.MouseEvent;
	
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.meiren.BtnTiaoZhan;
	import org.mokylin.skin.app.meiren.BtnTiaoZhan2;
	import org.mokylin.skin.app.meiren.MeiRenTiaoZhan;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;
	
	public class MeiRenTiaoZhanChengGongPanel extends SkinUIPanel
	{
		private var _skin:MeiRenTiaoZhan;
		
		private var _zoneBalls:Vector.<PetZoneBall>;
		private var _items:Vector.<IconCDFace>;
		private var _info:PetInfo;
		private var _msg:ResPetZoneResultMessage;
		private var _time:int=0;
		private var _modContaner:Inter3DContainer;
		private var _avatar : InterAvatar3D;
		private var _avatarData : RoleData;
		private var _q_girl_pet:Q_girl_pet;
		
		public function MeiRenTiaoZhanChengGongPanel()
		{
			_skin=new MeiRenTiaoZhan();
			super(_skin);
			initPanel();
		}
		
		private function initPanel():void
		{
			_zoneBalls=new Vector.<PetZoneBall>();
			_items=new Vector.<IconCDFace>();
			_modContaner=new Inter3DContainer();
			this._skin.container.addChildAt(_modContaner,1);
			_avatar=new InterAvatar3D();
			_avatar.x = 270;
			_avatar.y =360;
			_modContaner.addChild3D(_avatar);
			for (var j:int = 0; j < 9; j++) 
			{
				_zoneBalls.push(new PetZoneBall(_skin["icon"+(j+1)]));
			}
			
			for(var i:int=1;i<=4;i++)
			{
				var ico:IconCDFace=new IconCDFace(IcoSizeEnum.ICON_48);
				var uiasset:UIAsset=_skin["ic"+(i)] as UIAsset;
				ico.selectImgVisible=false;
				_skin.grpIcon1.addChild(ico);
				_items.push(ico);
				ico.bindBg(uiasset);
			}
		}
		
		public override function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show();		
			_msg=data as ResPetZoneResultMessage;
			_info=Mgr.petMgr.getPet(_msg.petId);
			_q_girl_pet=PetCfg.getPet(_msg.petId);
			initModEff();
			showZoneBall(_msg.level);			
			showPrize();			
			_time=_msg.time;
			if(_msg.level==_q_girl_pet.q_need_zone)
			{
				_skin.btn_next.visible=false;
				_skin.skinJihuo.visible=true;
				TimerServer.addLoop(onExtTimer,1000);		
			}
			else
			{
				_skin.btn_next.visible=true;
				_skin.skinJihuo.visible=false;
				updateBtnShow(_msg.level);	
				TimerServer.addLoop(onTimer,1000);
			}
		}
		
		override protected function onHide():void
		{
			super.onHide();
			clearPanel();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case (_skin.btn_next.skin as BtnTiaoZhan).btnBg:
					toNextMessage();
					break;
				case (_skin.skinJihuo.skin as BtnTiaoZhan2).btnBg:
					toOutTheZone();
					break;
			}			
		}
		
		private function initModEff():void
		{			
			_avatarData=new RoleData(0);
			this._avatarData.avatarInfo.setBodyResID(_q_girl_pet.q_panel_show_id,null);
			this._avatar.setRoleData(this._avatarData);
			this._avatar.curRole.setScale(1.5);	
			this._avatar.curRole.stateMachine.transition(RoleStateType.ACTION_IDLE);
		}
		
		private function onMouseclickHandler(e:MouseEvent):void
		{
			toNextMessage();
		}
		
		private function toNextMessage():void
		{
			PetSender.reqEnterNextLevelMessage(_msg.zoneModelId);
			this.hide();
		}
		
		private function toOutTheZone():void
		{
			DungeonSender.zoneOutToGame();
			this.hide();
		}
		
		private function showPrize():void
		{
			if(_info.passlevel<_msg.level)
			{
				var arr:Array=JSONUtil.decode(_q_girl_pet.q_zone_reward);
				arr=arr[(_msg.level-1)]; 
				if(arr is Array)
				{
					for(var i:int=0;i<_items.length;i++)
					{
						if(i<arr.length)
						{
							var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(arr[i].mod,arr[i].num);
							FaceUtil.SetItemGrid(_items[i],itemInfo);
							_items[i].visible=true;
						}
						else
						{
							_items[i].visible=false;
						}
					}
				}
				_skin.grpIcon1.visible=true;
			}
			else
			{
				_skin.grpIcon1.visible=false;
			}
		}
		
		private function showZoneBall(num:int):void
		{
			var len:int=_zoneBalls.length;
			for (var i:int = 0; i < len; i++) 
			{
				_zoneBalls[i].setEffect(i<num);
				_zoneBalls[i].setData(_info,(i+1),true);
			}
		}
		
		private function updateBtnShow(nowLv:int):void
		{
			var nextNum:int=nowLv+1;
			var btn:BtnTiaoZhan=_skin.btn_next.skin as BtnTiaoZhan;
			btn.uiNum.styleName = "ui/app/meiren/tiaozhan/"+nextNum+".png";
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			if(_time>0) 
			{
				_skin.lb_time.text="继续挑战下一关倒计时:"+_time.toString();
				_time--;
			}
			else{
				TimerServer.remove(onTimer);
				toNextMessage();
			}
		}
		
		private function onExtTimer():void
		{
			if(_time>0) 
			{
				_skin.lb_time.text="退出倒计时:"+_time.toString();
				_time--;
			}
			else{
				TimerServer.remove(onExtTimer);
				toOutTheZone();
			}
		}
		
		private function clearPanel():void
		{
			TimerServer.remove(onTimer);
			TimerServer.remove(onExtTimer);
			if(_avatar!=null)
			{
				_modContaner.removeChild3D(_avatar);
				_avatar.dispose();
			}
			for (var i:int = 0; i < _zoneBalls.length; i++) 
			{
				_zoneBalls[i].setEffect(false);
			}
		}
	}
}