package com.rpgGame.app.view.icon
{
	import com.rpgGame.app.utils.DragDropUtil;
	import com.rpgGame.app.view.uiComponent.menu.Menu;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.MouseListenerUtil;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	
	import feathers.dragDrop.DragData;
	import feathers.dragDrop.DragDropManager;
	import feathers.events.DragDropEvent;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import utils.KeyboardMananger;
	import utils.TimerServer;

	
	/**
	 * 可拖动的格子			
	 * _gridInfo这个数据必须要，定义这个格子所在的容器ID、下标及是否锁定等信息
	 * @author wewell@163.com
	 * 
	 */	
	public class DragDropGrid extends IconCDFace
	{
		protected var _gridInfo:GridInfo;
		
		/** 点击时回调 */		
		private var _touchEndFun:Function;
		
		private var _preTouchTime:uint;
		
		public function DragDropGrid($iconSize:int)
		{
			super($iconSize);
			touchGroup = false;
			_showCD=true;
		}
		
		/**
		 *格子所在数据容器ID,只读
		 */	
		public function get containerID():int
		{
			return _gridInfo.containerID;	
		}
		
		/**
		 *格子所在数据容器中的下标 ,只读
		 */		
		public function get index():int
		{
			return _gridInfo.index;
		}
		
		/**
		 * 格子信息,携带容器编号及格子下标等数据,永远不能为空 
		 */		
		public function get gridInfo():GridInfo
		{
			return _gridInfo;
		}
		
		/**
		 *格子信息,携带容器id及格子下标等数据,永远不能为空 
		 */		
		public function set gridInfo(value:GridInfo):void
		{
			_gridInfo = value;
		}
		
		override public function set isEnabled(b:Boolean):void
		{
			if(_isEnabled == b)return;
			b ? this.filter = null : GrayFilter.gray(this);
			if(_gridInfo)_gridInfo.isEnabled = b;
			super.isEnabled = b;
		}
		
		public function setGridEmpty():void
		{
			clear();
			if(gridInfo && !gridInfo.isUnlock)
			{
				TipTargetManager.remove(this);
			}
		}
		
		//==================================DragDrop============================================
		private static const DRAG_FORMAT : String = "DragDropGrid";
		protected static var dragSource:DragDropGrid;
		protected static var dropTarget:DragDropGrid;
		private var _dragAble : Boolean = true;
		private var _touchID : int = -1;
		private var _draggedObject : DisplayObject;
		private var _touchOffX : int;
		private var _touchOffY : int;
		
		public function set dragAble(b : Boolean) : void
		{
			_dragAble = b;
			b ? activeDragDrop() : inactiveDragDrop();
		}
		
		public function get dragAble() : Boolean
		{
			return _dragAble;
		}
		
		private function activeDragDrop() : void
		{
			this.addEventListener(starling.events.TouchEvent.TOUCH, touchHandler);
			this.addEventListener(DragDropEvent.DRAG_START, dragStartHandler);
			this.addEventListener(DragDropEvent.DRAG_COMPLETE, dragCompleteHandler);
		}
		
		private function inactiveDragDrop() : void
		{
			this.removeEventListener(starling.events.TouchEvent.TOUCH, touchHandler);
			this.removeEventListener(DragDropEvent.DRAG_START, dragStartHandler);
			this.removeEventListener(DragDropEvent.DRAG_COMPLETE, dragCompleteHandler);
		}
		
		private function touchHandler(event : starling.events.TouchEvent) : void
		{
			if ( DragDropManager.isDragging || (_gridInfo && !_gridInfo.isEnabled) || !isEnabled || isShowLockAsset)
				return;
			
			if (this._touchID >= 0)
			{
				var touch : Touch = event.getTouch(this._draggedObject, null, this._touchID);
				if (!touch)
					return;
				
				if (touch.phase == TouchPhase.MOVED)
				{
					if( _gridInfo == null || iconResURL == "" ||(checkDrag&&checkDrag()))
						return;
					
					
					_touchID = -1;
					
					//EventManager.dispatchEvent(ItemEvent.ITEM_PRE_MOVE, faceInfo);
					//return;
					
//					if(KeyboardMananger.isKeyDown(Keyboard.CONTROL))
//					{
//						EventManager.dispatchEvent(ItemEvent.ITEM_PRE_SPLITE, faceInfo);
//						return;
//					}
				
					var pos:Point = this.parent.localToGlobal(new Point(this.x, this.y));
					_touchOffX =  this.iconSize/2;
					_touchOffY = this.iconSize/2;
					
					if(dragSource == null)
					{
						dragSource = new DragDropGrid( iconSize );
						dragSource.touchable = dragSource.touchGroup = false;
						dragSource.gridInfo = new GridInfo( containerID, index );
					}
					
					//当前格子数据复制
					dragSource.x = pos.x
					dragSource.y = pos.y;
					var temp : GridInfo = new GridInfo(gridInfo.containerID,gridInfo.index);
					temp.data = gridInfo.data;
					temp.realIndex = gridInfo.realIndex;
					temp.isEnabled = gridInfo.isEnabled;
					temp.isTips = gridInfo.isTips;
					temp.isUnlock = gridInfo.isUnlock;
					temp.unlockInfo = gridInfo.unlockInfo;
					dragSource.gridInfo = temp;
					dragSource.setIconResName( iconResURL );
					
					//dragSource.count = itemInfo.count;
					stage.addChild(dragSource);
					
					dropTarget = null;
					
					//拖出去后，格子源的变化。或清空，或设置成灰态，可覆写
					dragSourceOutChange();
					
					//开始拖动
					var dragData : DragData = new DragData();
					dragData.setDataForFormat(DRAG_FORMAT, this);
					DragDropManager.startDrag(this, touch, dragData);
					//开始拖动，把这个格子的数据记录下来
					DragDropUtil.sourceGridInfo = dragSource.gridInfo;
					DragDropUtil.isInDrag = true;
					trace("正在记录数据");
					Menu.GetInstance().hide();
				}
				else if (touch.phase == TouchPhase.ENDED)
				{
					this._touchID = -1;
					//trace("TouchPhase.ENDED", index);
					if ( (_gridInfo && !_gridInfo.isEnabled) || !isEnabled)return;
					if(_doubleClickFun){
						var time:int=getTimer();
						if(time-_preTouchTime<300){//点击间隔小于300毫秒视为双击
							_doubleClickFun(this);
							_preTouchTime=0;
						}else{
							if(_touchEndFun != null)_touchEndFun(this);
						}
						_preTouchTime=time;
					}else{
						if(_touchEndFun != null)_touchEndFun(this);
					}
				}
			}
			else
			{
				touch = event.getTouch(this, TouchPhase.BEGAN);
				if (!touch)
				{
					//trace("TouchPhase.BEGAN", index);
					//拖拽完成时的格子
					dropTarget = this;
					return;
				}
				this._touchID = touch.id;
				this._draggedObject = this;
			}
		}
		
		public function set onTouchEndCallBack(value:Function):void
		{
			_touchEndFun = value;
		}
		
		private function dragStartHandler(event : DragDropEvent, dragData : DragData) : void
		{
			this.addEventListener(starling.events.TouchEvent.TOUCH, onDragMove);
			EventManager.dispatchEvent(event.type,dragData);
		}
		
		private function onDragMove(event : starling.events.TouchEvent) : void
		{
			var touch : Touch = event.getTouch(stage);
			if (touch && touch.phase == TouchPhase.MOVED)
			{
				dragSource.x = touch.globalX - _touchOffX;
				dragSource.y = touch.globalY - _touchOffY;
			}
		}
		
		private function dragCompleteHandler(event : DragDropEvent, dragData : DragData) : void
		{
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onDragMove);
			EventManager.dispatchEvent(event.type,dragData);
			if(dragSource && dragSource.parent != null)
			{
				TimerServer.delayCall(droped,1);
			}
		}
		
		private function droped():void
		{
			DragDropUtil.isInDrag = false;
			dragComplete();
			if( dropTarget == null )
				EventManager.dispatchEvent(ItemEvent.ITEM_DROPED, dragSource.gridInfo, null );
			else
			{
				EventManager.dispatchEvent(ItemEvent.ITEM_DROPED, dragSource.gridInfo, dropTarget.gridInfo);
			}
		}
		
		protected function hideDragSource():void
		{
			if(dragSource && dragSource.parent != null)
			{
				dragSource.removeFromParent();
			}
		}
		//==================================End DragDrop============================================
		
		/**
		 * 拖动完成表现
		 * 
		 */		
		protected function dragComplete():void
		{
			hideDragSource();
		}
		
		protected function dragSourceOutChange():void
		{
			clear();
			TipTargetManager.remove(this);
		}
		
		protected function dragSourceBack():void
		{
//			var pos:Point = this.parent.localToGlobal(new Point(this.x, this.y));
//			TweenLite.to(dragSource,0.5,{x:pos.x, y:pos.y, onComplete:onBackComplete});
			hideDragSource();
		}
		
		protected function onBackComplete():void
		{
//			FaceUtil.setGridData(this, dragSource.gridInfo.data, true);
			hideDragSource();
		}
		//----------------------------------------------
		
		//------------------------------------
		private var mouseIn:Boolean;
		
		private var _doubleClickFun:Function;
		public function get doubleClickFun():Function
		{
			return _doubleClickFun;
		}
		
		public function set doubleClickFun(value:Function):void
		{
			if( _doubleClickFun == value )
				return;
			
			_doubleClickFun = value;
		}
		
		//---------------------@author luguozheng----------------------------- 
		private var _rightMouseClickFun:Function;
		public var checkDrag:Function;
		public function get rightMouseClickFun():Function
		{
			return _rightMouseClickFun;
		}
		
		public function set rightMouseClickFun(value:Function):void
		{
			if( _rightMouseClickFun == value )
				return;
			
			_rightMouseClickFun = value;
			
			if( _rightMouseClickFun != null )
			{
				MouseListenerUtil.addEventListener( this, null, mouseOver, mouseOut );
				Starling.current.nativeStage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onRightDown);
			}
			else
			{
				removeOverAndOut()
				Starling.current.nativeStage.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onRightDown);
			}
		}
		
		private function onRightDown( e:MouseEvent ):void
		{
			if( !checkClick() )
				return;
			
			if( _rightMouseClickFun != null )
				_rightMouseClickFun( this );
		}
		
		private function checkClick():Boolean
		{
			var mousePoint : Point = this.globalToLocal(new Point(Starling.current.nativeStage.mouseX, Starling.current.nativeStage.mouseY))
			return  hitTest(mousePoint) && mouseIn && isEnabled && !isShowLockAsset;
		}
		
		private function mouseOut():void
		{
			mouseIn = false;
			if(_gridInfo.isUnlock&&!_gridInfo.unlockInfo){
				setBg( GridBGType.CHORTCUT_2_MASK );
			}
		}
		
		private function mouseOver():void
		{
			mouseIn = true;
			if(_gridInfo.isUnlock&&!_gridInfo.unlockInfo){
				setBg( GridBGType.CHORTCUT_3_MASK );
			}
		}
		
		private function removeOverAndOut():void
		{
			if( _rightMouseClickFun != null || _doubleClickFun != null )
				return;
			
			MouseListenerUtil.removeEventListener( this );
		}
		//---------------------------
	}
}


