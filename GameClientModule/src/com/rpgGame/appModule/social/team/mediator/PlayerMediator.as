package   com.rpgGame.appModule.social.team.mediator
{
	import com.game.engine2D.config.MapConfig;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.appModule.social.team.MyTeamPanelExt;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.coreData.cfg.ClientSceneCfgData;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.utils.FilterUtil;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.team.bean.TeamMemberInfo;
	
	import flash.geom.Point;
	
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.shejiao.zudui.Zudui_Head;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;


	public class PlayerMediator extends Object
	{
		private static var select:PlayerMediator;
		private var _member:TeamMemberInfo;
		private var _player:Group;
		private var _mainPanel:MyTeamPanelExt;
		
		private var _headTitle:SkinnableContainer;
		private var _labMap:Label;
		private var _imgCon:UIAsset;
		
		public var labNameInitY:int=0;
		public var conInitY:int=0;
		public var gid:int = 0;
		
		private var _toFar:Boolean = false;
		
		//private var roleModel:RoleModelEffect;
		private  var isMouseOut : Boolean = true;
		public function PlayerMediator(player:Group,con:UIAsset,head:SkinnableContainer,map:Label , mainPanel:MyTeamPanelExt)
		{
			super();
			_player = player;
			_mainPanel = mainPanel;
			_imgCon = con;
			_labMap =map;
			_headTitle = head;
			labNameInitY=_headTitle.y;
			conInitY=con.y;
			_player.addEventListener(TouchEvent.TOUCH, onTouch);
			
		}
		private function onTouch(e:TouchEvent):void
		{
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
			if (touch != null && isMouseOut)
			{
				isMouseOut = false;
				OnPlayerPanel();
				return;
			}
		}
		//private var overEffect:UIEffect2D;
		private function OnRollOut():void
		{
//			if(overEffect != null)
//			{
//				overEffect.Dispose();
//				overEffect = null;
//			}
		}
		private function OnRollOver():void
		{
//			if(selectEffect != null)
//				return ;
//			if(overEffect == null)
//			{
//				overEffect = UIEffect2D.Create( 1076 , 0 ,true);
//				overEffect.x = _player.uiWidth * 0.5;
//				overEffect.y = _player.uiHeight * 0.5 + 70;
//				_player.addChildAt( overEffect , 0 );
//			}
		}
	//	private var selectEffect:UIEffect2D;
		private function OnPlayerPanel():void
		{
//			if(!_member.memberId.EqualTo( MainRoleManager.actorInfo.serverID))
//			{
//				var p :Point = _player.localToGlobal(new Point(_player.mouseX, _player.mouseY));
//				var omenu :TeamMenuPanelExt = TeamMenuPanelExt.instance;
//				omenu.x = p.x - 10;
//				omenu.y = p.y - 10;
//				omenu.SetData( _player, _member,  Mgr.teamMgr.isCaptain?TeamMenuPanelExt.TYPE_CAPTAIN:TeamMenuPanelExt.TYPE_MEMBER );
//				Mgr.uiMgr.showPanel(omenu);
//				MCUtil.BringToTop( omenu );
//			}
			if(select != null)
				select.RemoveSelectEffect();
			select = this;
			OnRollOut();
			CreateSelectEffect();
		}
		public function RemoveSelectEffect():void
		{
//			if(selectEffect != null)
//			{
//				selectEffect.Dispose();
//				selectEffect = null;
//			}
		}
		private function CreateSelectEffect():void
		{
//			if(selectEffect == null)
//			{
//				selectEffect = UIEffect2D.Create( 1075 , 0 , true );
//				selectEffect.x = _player.uiWidth * 0.5;
//				selectEffect.y = _player.uiHeight * 0.5 + 70;
//				_player.addChildAt( selectEffect , 0 );
//			}
		}
		public function SetData(member:TeamMemberInfo):void
		{
			_member = member;
			toFar = true;
			if(member != null)
			{
				gid = member.memberId.ToGID();
				(_headTitle.skin as Zudui_Head).lab_name.text=member.memberName+"【"+member.memberLevel+"】";
				
				var map:Q_map =  ClientSceneCfgData.getSceneInfo( member.memberMapModelID );
				//还需要添加线路
//				UIUtil.connectLabelHtmltext( labMap , ["Lv."+member.memberLevel+" " + ( map != null?map.q_map_name:"") ]);
				var str:String=map.q_map_name;
				var isOffline:Boolean;
				if (isOffline) 
				{
					str+=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,"(离线)");
				}
				else
				{
					if (member.memberMapModelID!=MapDataManager.currentScene.sceneId) 
					{
						str+=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_YELLOW,"(远离)");
					}
					else
					{
						toFar=false;
					}
				}
				labMap.htmlText=str;
//				var showModel:PlayerModelVO = new PlayerModelVO( member.appearanceInfo );
//				if(roleModel == null)
//				{
//					roleModel = new RoleModelEffect( showModel.clothesId , showModel.sex , showModel.weaponId, 0 , 0 ,showModel.wingModelId);
//				}
//				else
//				{
//					roleModel.ChangeSex( showModel.sex );
//					roleModel.ChangeRoleModel( showModel.clothesId );
//					roleModel.ChangeWeapon( showModel.weaponId );
//					roleModel.ChangeSwing( showModel.wingModelId );
//				}
//				
//				roleModel.changeStandModel();
//				
//				imgCon.addChild( roleModel );
//				
//				roleModel.x = 10;
////				if(showModel.sex==1){
////					roleModel.y = -140;
////				}else{
////					roleModel.y = -170;
////				}
//				roleModel.y=-140+roleModel.getOffsetY();
				this.visible = true;
				
			}else
			{
				gid = 0;
				this.visible = false;
//				if(roleModel != null)
//				{
//					roleModel.Dispose();
//					roleModel = null;
//				}
				toFar = true;
			}
		}
		
		public function get visible():Boolean
		{
			return _player.visible;
		}

		public function set visible(value:Boolean):void
		{
			_player.visible = value;
		}

		public function get member():TeamMemberInfo
		{
			return _member;
		}

		public function get toFar():Boolean
		{
			return _toFar;
		}

		public function set toFar(value:Boolean):void
		{
			_toFar = value;
			if(member != null)
			{
				var map:Q_map =ClientSceneCfgData.getSceneInfo( member.memberMapModelID );
				if(_toFar)
				{
					imgCon.filter = FilterUtil.getGrayFilter();
					
					TipTargetManager.show(_imgCon,TargetTipsMaker.makeSimpleTextTips(HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,"处于远离或离线状态的队员，将不被计入组队经验加成与生命上限加成的有效人数")));
				}else
				{
					imgCon.filter=null;
					
					TipTargetManager.remove(_imgCon);
				}
			}
		}

		public function get player():Group
		{
			return _player;
		}

		public function get headTitle():SkinnableContainer
		{
			return _headTitle;
		}

		public function get labMap():Label
		{
			return _labMap;
		}

		public function get imgCon():UIAsset
		{
			return _imgCon;
		}


	}
}