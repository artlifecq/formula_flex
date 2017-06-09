package com.rpgGame.app.manager.role
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.engine3D.vo.SoftOutlineData;
	import com.rpgGame.app.graphics.DropItemHeadFace;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.fight.FightManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.core.controller.MouseCursorController;
	import com.rpgGame.core.events.SceneInteractiveEvent;
	import com.rpgGame.core.manager.EscActionManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import away3d.filters.OutlineGlowFilter3D;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	 *
	 * 场景角色选择管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-20 上午10:02:16
	 *
	 */
	public class SceneRoleSelectManager
	{
		private static var _enemyOutlineData : SoftOutlineData = new SoftOutlineData(0xFF0000, 0.8, 0.005, 5);
		private static var _friendOutlineData : SoftOutlineData = new SoftOutlineData(0x00FF00, 0.8, 0.005, 5);
		private static var _neutralOutlineData : SoftOutlineData = new SoftOutlineData(0xFFFF00, 0.8, 0.005, 5);
		private static var _dummyOutlineData : SoftOutlineData = new SoftOutlineData(0x00FF00, 0.8, 0.0025, 5);
		private static var _selectedRingRedId : String = EffectUrl.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
		private static var _selectedRingGreenId : String = EffectUrl.FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
		private static var _selectedRingYellowId : String = "quanhuang";
		
		private static var _selectedRole : SceneRole;
		
		/**
		 * @private
		 * 鼠标在上面的角色
		 */
		private static var _mouseOverRole : SceneRole;
		
		public function SceneRoleSelectManager()
		{
		}
		
		public static function setup() : void
		{
		}
		
		public static function setOutlineData(size : Number = 4, strength : Number = 1, quality : int = 3, enemyColor : uint = 0xFF0000, friendColor : uint = 0x00FF00, neutralColor : uint = 0xFFFF00) : void
		{
			var outlineGlowFilter : OutlineGlowFilter3D = new OutlineGlowFilter3D(size, strength);
			SceneManager.getScene().setOutlineGlowFilter(outlineGlowFilter);
			_enemyOutlineData = new SoftOutlineData(enemyColor);
			_friendOutlineData = new SoftOutlineData(friendColor);
			_neutralOutlineData = new SoftOutlineData(neutralColor);
		}
		
		public static function get mouseOverRole() : SceneRole
		{
			return _mouseOverRole;
		}
		
		public static function get selectedRole() : SceneRole
		{
			return _selectedRole;
		}
		
		public static function updateSelectRole() : void
		{
			selectedRole = _selectedRole;
		}
		
		/**
		 * 访问的角色（鼠标选中）
		 */
		public static function set selectedRole(value : SceneRole) : void
		{
			if (value)
			{
				//不在视野范围内不能选中
				if (!RoleStateUtil.isTargetInMyEye(value))
					return;
			}
			
			if (value != null && value.type == SceneCharType.BIAO_CHE) //镖车伪装的时候，自己的镖车不需要选择
			{
				if (value.isMainCamouflage)
					return;
			}
			
			//选择同一目标仅发送选择事件
			if (_selectedRole && _selectedRole == value && !value.fightChange)
			{
				if (_selectedRole.usable && !_selectedRole.stateMachine.isDeadState)
				{
					_selectedRole.updateInteractTime();
					EventManager.dispatchEvent(SceneInteractiveEvent.SELECTED_SCENE_ROLE, _selectedRole);
				}
				return;
			}
			
			EscActionManager.removeAction(clearSelect);
			if (_selectedRole && _selectedRole.usable)
			{
				if (_selectedRole.headFace is HeadFace)
					((_selectedRole.headFace as HeadFace) as HeadFace).isSelected = false;
				else if (_selectedRole.headFace is DropItemHeadFace)
					(_selectedRole.headFace as DropItemHeadFace).isSelected = false;
				_selectedRole.avatar.removeRenderUnitByID(RenderUnitType.SELECTED_RING, RenderUnitID.SELECTED_RING);
			}
			_selectedRole = value;
			if (_selectedRole && _selectedRole.usable && (!_selectedRole.stateMachine.isDeadState||MainRoleManager.actorInfo.job==JobEnum.ROLE_4_TYPE))
			{
				if (_selectedRole.headFace is HeadFace)
					(_selectedRole.headFace as HeadFace).isSelected = true;
				else if (_selectedRole.headFace is DropItemHeadFace)
					(_selectedRole.headFace as DropItemHeadFace).isSelected = true;
				updateRoleRingEffect(_selectedRole);
				_selectedRole.updateInteractTime();
				EscActionManager.addAction(clearSelect);
			}
			else
			{
				_selectedRole = null;
			}
			EventManager.dispatchEvent(SceneInteractiveEvent.SELECTED_SCENE_ROLE, _selectedRole);
		}
		
		public static function updateRoleRingEffect(role : SceneRole) : void
		{
			if (!role || !role.usable)
				return;
			role.avatar.removeRenderUnitByID(RenderUnitType.SELECTED_RING, RenderUnitID.SELECTED_RING);
			var selectedRindId : String = "";
			var modeState : int = FightManager.getFightRoleState(role);
			if (modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY)
				selectedRindId = _selectedRingRedId;
			else if (modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND)
				selectedRindId = _selectedRingGreenId;
			else
				selectedRindId = _selectedRingGreenId;
			var rud : RenderParamData3D = new RenderParamData3D(RenderUnitID.SELECTED_RING, RenderUnitType.SELECTED_RING, ClientConfig.getEffect(selectedRindId));
			var effectRu : RenderUnit3D = role.avatar.addRenderUnit(rud);
			effectRu.repeat = 0;
			effectRu.visible = false;
			effectRu.play(0);
			var bodyAp : RenderUnit3D = role.avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY);
			if (bodyAp)
			{
				if (bodyAp.resReady)
					selectedRolePartAddedCallBack(effectRu, bodyAp);
				else
					bodyAp.setAddedCallBack(selectedRolePartAddedCallBack, effectRu);
			}
		}
		
		private static function selectedRolePartAddedCallBack(effectRu : RenderUnit3D, ru : RenderUnit3D) : void
		{
			CONFIG::netDebug {
				function getBounds() : VolumeBounds
				{
					var _animatorElements : Vector.<CompositeMesh> = ru.getAnimatorElements();
					var _drawElements : Vector.<ObjectContainer3D> = ru.getDrawElements();
					if (!_drawElements)
					{
						return null;
					}
					var bounds : VolumeBounds = null;
					if (_animatorElements)
					{
						for each (var animatElement : CompositeMesh in _animatorElements)
						{
							CONFIG::netDebug {
								NetDebug.LOG("[getBounds] [_animatorElements] " +
									"minX:" + animatElement.minX + ", " +
									"minY:" + animatElement.minY + ", " +
									"minZ:" + animatElement.minZ + ", " +
									"maxX:" + animatElement.maxX + ", " +
									"maxY:" + animatElement.maxY + ", " +
									"maxZ:" + animatElement.maxZ + ", " +
									"scaleX:" + animatElement.scaleX + ", " +
									"scaleY:" + animatElement.scaleY + ", " + 
									"scaleZ:" + animatElement.scaleZ);
							}
								bounds = new VolumeBounds(animatElement.minX * animatElement.scaleX, animatElement.minY * animatElement.scaleY, animatElement.minZ * animatElement.scaleZ, //
									animatElement.maxX * animatElement.scaleX, animatElement.maxY * animatElement.scaleY, animatElement.maxZ * animatElement.scaleZ);
							return bounds;
						}
					}
					else
					{
						for each (var element : ObjectContainer3D in _drawElements)
						{
							CONFIG::netDebug {
								NetDebug.LOG("[getBounds] " +
									"minX:" + element.minX + ", " +
									"minY:" + element.minY + ", " +
									"minZ:" + element.minZ + ", " +
									"maxX:" + element.maxX + ", " +
									"maxY:" + element.maxY + ", " +
									"maxZ:" + element.maxZ + ", " +
									"scaleX:" + element.scaleX + ", " +
									"scaleY:" + element.scaleY + ", " + 
									"scaleZ:" + element.scaleZ);
							}
								bounds = new VolumeBounds(element.minX * element.scaleX, element.minY * element.scaleY, element.minZ * element.scaleZ, //
									element.maxX * element.scaleX, element.maxY * element.scaleY, element.maxZ * element.scaleZ);
							return bounds;
						}
					}
					return null;
				}
				var bounds : VolumeBounds = getBounds();
				if (bounds)
				{
					NetDebug.LOG("load select role part added callback maxX:" + bounds.maxX + ", minX:" + bounds.minX);
				} else {
					NetDebug.LOG("load select role part added callback bounds is null");
				}
			}
				ru.removeAddedCallBack(selectedRolePartAddedCallBack);
			if (ru && ru.usable && effectRu && effectRu.usable)
			{
				effectRu.visible = true;
				effectRu.scaleX = effectRu.scaleZ = ru.width / 150;
			}
		}
		
		public static function set mouseOverRole(value : SceneRole) : void
		{
			if (value && _mouseOverRole == value && !value.fightChange)
				return;
			
			if (_mouseOverRole && _mouseOverRole.usable)
			{
				if (_mouseOverRole != _selectedRole)
				{
					if (_mouseOverRole.headFace is HeadFace)
						(_mouseOverRole.headFace as HeadFace).isSelected = false;
					else if (_mouseOverRole.headFace is DropItemHeadFace)
					{
						(_mouseOverRole.headFace as DropItemHeadFace).isSelected = false;
						(_mouseOverRole.headFace as DropItemHeadFace).isShow = false;
					}
					
				}
				
				_mouseOverRole.forEachRenderUnit(setRoleMouseOut);
			}
			
			_mouseOverRole = value;
			
			if (_mouseOverRole && _mouseOverRole.usable && !_mouseOverRole.stateMachine.isDeadState)
			{
				if (_mouseOverRole.headFace is HeadFace)
					(_mouseOverRole.headFace as HeadFace).isSelected = true;
				else if (_mouseOverRole.headFace is DropItemHeadFace)
				{
					(_mouseOverRole.headFace as DropItemHeadFace).isSelected = true;
					(_mouseOverRole.headFace as DropItemHeadFace).isShow = true;
				}
				_mouseOverRole.forEachRenderUnit(setRoleMouseOver);
			}
			else
				_mouseOverRole = null;
			
			updateRoleMouseCursor();
		}
		
		public static function updateRoleMouseCursor() : void
		{
			if (_mouseOverRole && _mouseOverRole.usable && !_mouseOverRole.stateMachine.isDeadState)
			{
				var modeState : int = FightManager.getFightRoleState(_mouseOverRole);
				if (modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY)
				{
					MouseCursorController.showAttack();
				}
				else if (modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND)
				{
					MouseCursorController.showFinger();
				}
				else
				{
					switch (_mouseOverRole.type)
					{
						case SceneCharType.PLAYER:
							MouseCursorController.showFinger();
							break;
						case SceneCharType.MONSTER:
							var monsterData : MonsterData = _mouseOverRole.data as MonsterData;
							if (monsterData != null&&monsterData.monsterData.q_monster_type==4)//npc显示对话鼠标样式
							{
								MouseCursorController.showTalk();
							}
							break;
						case SceneCharType.COLLECT:
							MouseCursorController.showCollect();
							break;
						case SceneCharType.DROP_GOODS:
							MouseCursorController.showCollect();
							break;
						default:
							MouseCursorController.showNormal();
							break;
					}
				}
			}
			else
			{
				MouseCursorController.showNormal();
			}
		}
		
		public static function clearSelect() : void
		{
			selectedRole = null;
		}
		
		/**设置鼠标滑进*/
		private static function setRoleMouseOver(role : SceneRole, ru : RenderUnit3D) : void
		{
			switch (ru.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
				case RenderUnitType.MOUNT:
					var modeState : int = FightManager.getFightRoleState(role);
					if (modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY)
					{
						ru.setSoftOutline(_enemyOutlineData);
					}
					else if (modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND)
					{
						ru.setSoftOutline(_friendOutlineData);
					}
					else if (modeState==FightManager.FIGHT_ROLE_DUMMY) 
					{
						ru.setSoftOutline(_dummyOutlineData);
					}
					else
					{
						ru.setSoftOutline(_friendOutlineData);
					}
					break;
			}
		}
		
		/**设置鼠标划出*/
		private static function setRoleMouseOut(role : SceneRole, ru : RenderUnit3D) : void
		{
			switch (ru.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
				case RenderUnitType.MOUNT:
					ru.setSoftOutline(null);
					break;
			}
		}
	}
}
