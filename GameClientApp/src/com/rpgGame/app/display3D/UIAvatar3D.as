package com.rpgGame.app.display3D
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.AvatarInfo;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Point;
	
	import feathers.controls.UIAsset;
	import feathers.core.FeathersControl;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 *用于UI上的带动作的3d模型展示
	 * 模型位置默认和容器底部居中对齐
	 * @author dik
	 * 
	 */
	public class UIAvatar3D extends Inter3DContainer
	{
		private static const HELPER_POINT : Point = new Point();
		private var avatar3d:InterObject3D;
		private var role:SceneRole;
		private var touchZone:UIAsset;
		private var _touchID:int=-1;
		private var startX:Number;
		
		/**
		 * 
		 * @param container avatar显示的父容器,交互区域有多大，在编辑器里面就拉多大,方便布局
		 * 
		 */
		public function UIAvatar3D(container:DisplayObjectContainer=null)
		{
			super();
			avatar3d=new InterObject3D();
			this.addChild3D(avatar3d);
			initForContainer();
		}
		
		private function initForContainer(container:DisplayObjectContainer=null):void
		{
			if(container){
				container.addChild(this);
				this.x=container.width>>1;
				this.y=container.height;
				updateTouchZone();
			}			
		}
		
		/**
		 *绑定到对应的容器 
		 * @param container
		 * 
		 */
		public function bindContainer(container:DisplayObjectContainer):void
		{
			if(container){
				container.addChild(this);
				this.x=container.width>>1;
				this.y=container.height;
				updateTouchZone();
			}
		}
		
		private function updateTouchZone():void
		{
			if(touchable&&parent){
				if(!touchZone){
					this.touchZone=new UIAsset();
					touchZone.styleName="ui/common/hover/xuanqukuang2_alpha.png";//一张透明九宫作为交互背景图
					touchZone.addEventListener(TouchEvent.TOUCH,onTouch);
				}
				touchZone.width=parent.width;
				touchZone.height=parent.height;
				parent.addChild(touchZone);
			}
		}
		
		private function onTouch(e : TouchEvent) : void
		{
			var touch : Touch;
			if(_touchID!=-1){
				touch = e.getTouch(touchZone,null,this._touchID);
				if (!touch)
					return;
				if (touch.phase == TouchPhase.MOVED)
				{
					var movex:Number=touch.globalX-startX;
					avatar3d.rotationY = movex;
				}else if (touch.phase == TouchPhase.ENDED)	{
					this._touchID = -1;
					avatar3d.rotationY = 0;
				}
			}else{
				touch = e.getTouch(this.touchZone, TouchPhase.BEGAN);
				if(touch){
					this._touchID=touch.id;
					startX=touch.globalX;
				}
			}
			
			var t : Touch = e.getTouch(this.touchZone, TouchPhase.ENDED);
			if (t != null && t.target != null && this.stage != null)
			{
				t.getLocation(this.stage, HELPER_POINT);
				var isInBounds : Boolean = true;
				if (t.target is DisplayObjectContainer)
				{
					isInBounds = DisplayObjectContainer(t.target).contains(this.stage.hitTest(HELPER_POINT));
				}
				var isEnabled : Boolean = true;
				if (t.target is FeathersControl)
				{
					isEnabled = FeathersControl(t.target).isEnabled;
				}
				if (isInBounds && isEnabled)
					onTouchTarget(t.target);
			}
		}
		
		private function onTouchTarget(target : DisplayObject) : void
		{
			if(touchZone==target){
				this.role.stateMachine.transition(RoleStateType.ACTION_SHOW);
			}
		}
		
		public function setRoleData(data : RoleData) : void
		{
			if (this.role == null)
			{
				this.role = SceneRole.create(SceneCharType.DUMMY, data.id);
				role.rotationX = 45;
			}
			this.role.data = data;
			
			role.avatar.shareMaterials = false;
			role.avatar.lightPicker = Stage3DLayerManager.screenLightPicker;
			//执行主换装更新
			AvatarManager.updateAllPart(role);
			
			transition(RoleStateType.ACTION_IDLE); //切换到“站立状态”
			
			avatar3d.setRenderUnit(role);
		}
		
		public function transition(actionType : int) : void
		{
			if (role != null)
				role.stateMachine.transition(actionType); //切换到“站立状态”
		}
		
		override public function set visible(value : Boolean) : void
		{
			super.visible = value;
			role.visible = value;
		}
		
		override public function dispose() : void
		{
			if (role)
			{
				SceneRole.recycle(role);
				role = null;
			}
			if(avatar3d){
				avatar3d.dispose();
				avatar3d=null;
			}
			if(touchZone){
				touchZone.removeEventListener(TouchEvent.TOUCH,onTouch);
				touchZone=null;
			}
			super.dispose();
		}
		
		public function setScale(num:Number):void
		{
			role.setScale(num);
		}
		
		public function updateWithRenderUnitID(ID:int,data:AvatarInfo):void
		{
			role.updateWithRenderUnitID(ID,data);
		}
	}
}