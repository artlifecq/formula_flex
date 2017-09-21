package    com.rpgGame.appModule.battle.jjzb
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.appModule.common.RoleModelShow;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.netData.zhengba.bean.ZhengBaBriefInfo;
	
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;


	public class JJBattlePlayerMediator extends Object
	{
	
		private var _player:SkinnableContainer;	
		private var _imgCon:UIAsset;
		private var _headIcon:UIAsset;
		private var _labRank:Label;
		private var _labName:Label;
		private var _fightPower:UINumber;
		private var _effect:Inter3DContainer;
		private var _effect3d:InterObject3D;
		private var _roleModel:RoleModelShow;
		private  var isMouseOut : Boolean = true;
		private var scale:Number;
		private var touchImg:Sprite;
		private var _stateImg:UIAsset;
		private var _data:ZhengBaBriefInfo;
		private var _type:int;
		public function JJBattlePlayerMediator(type:int,player:SkinnableContainer,con:UIAsset,headIcon:UIAsset,labRank:Label,labName:Label,fightPower:UINumber,sc:Number)
		{
			super();
			this._type=type;
			_player = player;
			_headIcon=headIcon;
			_imgCon = con;
			_labRank=labRank;
			_labName=labName;
			this.scale=sc;
			_fightPower=fightPower;
			//_player.touchGroup=true;
			
			touchImg=new Sprite;
			touchImg.addEventListener(TouchEvent.TOUCH, onTouch);
			touchImg.x=_imgCon.x+35;
			touchImg.y=_imgCon.y;
			//touchImg.styleName="ui/common/tips/tips_di2.png";
			touchImg.graphics.beginFill(0);
			touchImg.graphics.drawRect(0,0,_imgCon.width,_imgCon.height-35);
			touchImg.graphics.endFill();
//			touchImg.width=_player.width;
//			touchImg.height=_player.height;
			touchImg.alpha=0;
			_player.addChild(touchImg);
		}
		private function onTouch(e:TouchEvent):void
		{
			if (!_data) 
			{
				return;
			}
			if (_data.playerId.EqualTo(MainRoleManager.serverID)) 
			{
				return;
			}
			var target : DisplayObject = e.currentTarget as DisplayObject;
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null)
			{
				isMouseOut = true;
				OnRollOut();
				return;
			}
			
			touch = e.getTouch(target, TouchPhase.HOVER);
			if (touch != null && isMouseOut)
			{
				isMouseOut = false;
				OnRollOver();
				return;
			}
			touch = e.getTouch(target, TouchPhase.ENDED);
			if (touch != null)
			{
				isMouseOut = false;
				OnPlayerPanel();
				return;
			}
		}

		private function OnRollOut():void
		{
			
			showLoopEffect(false);
		}
		private function OnRollOver():void
		{
			
			showLoopEffect(true);
		}

		private function OnPlayerPanel():void
		{
			
			//Clipboard.generalClipboard.clear();
			//Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,"sssss");
		//	SceneRoleSelectManager.mouseOverRole=_roleModel.avatar.curRole;
			OnRollOut();
			
			if (_data) 
			{
				Mgr.jjBattleMgr.reqStartFight(_data.playerId,_type);
			}
			
		}
		public function SetData(data:ZhengBaBriefInfo):void
		{
			clearModel();
			this._data=data;
			var rank:int=data.rank;
			_labRank.text=getRankStr(rank);
			if (_headIcon) 
			{
				_headIcon.visible=rank<4;
				if (_headIcon.visible) 
				{
					_headIcon.styleName="ui/app/zhanchang/jingjichang/"+rank+".png"
				}
			}
			_labName.text=data.playerName;
			_fightPower.label=data.fightPower+"";
			_roleModel=new RoleModelShow();
			_roleModel.setData(data.playerAppearanceInfo,scale);
			_roleModel.setTouch(touchImg);
			_imgCon.addChild(_roleModel);
			_roleModel.x=_imgCon.width/2;
			_roleModel.y=_imgCon.height;
			this.visible=true;
		}
		private function getRankStr(rank:int):String
		{
			if (rank==1) 
			{
				return NotifyCfgData.getNotifyTextByID(61034);
			}
			else if (rank==2) 
			{
				return NotifyCfgData.getNotifyTextByID(61035);
			}
			else if (rank==3) 
			{
				return NotifyCfgData.getNotifyTextByID(61036);
			}
			return LanguageConfig.replaceStr(NotifyCfgData.getNotifyTextByID(61037),[rank]);
		}
		public function get visible():Boolean
		{
			return _player.visible;
		}

		public function set visible(value:Boolean):void
		{
			_player.visible = value;
		}
		public function get player():SkinnableContainer
		{
			return _player;
		}


		public function get imgCon():UIAsset
		{
			return _imgCon;
		}


		public function clearModel():void
		{
			// TODO Auto Generated method stub
			if (_roleModel) 
			{
				_roleModel.dispose();
				MCUtil.removeSelf(_roleModel);
				_roleModel=null;
				visible=false;
			}
		}
		public  function showLoopEffect(bool:Boolean):void
		{
			if (bool) 
			{
				if (!_effect) 
				{
					_effect =new Inter3DContainer();
					_effect.x=(this._imgCon.width)/2;
					_effect.y=(this._imgCon.height)/2;
					_effect3d=_effect.playInter3DAt(ClientConfig.getEffect("ui_tiaozhan2"),0,0,0);
					
				}
				if (_effect3d.isStarted==false) 
				{
					_effect3d.start();
				}
				this._imgCon.addChild(_effect);
			}
			else
			{
				if (_effect3d&&_effect3d.isStarted) 
				{
					_effect3d.stop();
				}
			}
		}
	}
}