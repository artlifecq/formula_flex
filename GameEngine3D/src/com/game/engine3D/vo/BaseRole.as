package com.game.engine3D.vo
{
	import com.game.engine3D.events.SceneEvent;
	import com.game.engine3D.events.SceneEventAction_char;
	import com.game.engine3D.scene.render.vo.BaseEntity;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 基础角色
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-5 上午11:12:28
	 *
	 */
	public class BaseRole extends BaseEntity
	{
		public var isMainChar : Boolean = false;
		public var isMainCamouflage : Boolean = false;
		public var ownerIsMainChar : Boolean = false;

		public function BaseRole(type : String, id : Number)
		{
			super(type, id);
		}

		override public function reSet($parameters : Array) : void
		{
			super.reSet($parameters);
		}

		override public function setCamouflageEntity(entity : BaseEntity) : void
		{
			if (_camouflageEntity == entity)
			{
				return;
			}
			if (isMainChar)
			{
				if (_camouflageEntity is BaseRole && _camouflageEntity.usable)
				{
					(_camouflageEntity as BaseRole).isMainCamouflage = false;
				}
			}
			super.setCamouflageEntity(entity);
			if (isMainChar)
			{
				if (_camouflageEntity is BaseRole && _camouflageEntity.usable)
				{
					(_camouflageEntity as BaseRole).isMainCamouflage = true;
				}
			}
		}

		protected var _status : String;

		protected var _logicAngle : uint;

		/**
		 * 设置状态
		 */
		public function set logicAngle($logicAngle : uint) : void
		{
			_logicAngle = $logicAngle;
			//派发角色状态改变事件
			EventManager.dispatchEvent(SceneEvent.CHAR, SceneEventAction_char.CHAR_LOGICANGLE_CHANGED, this);
		}

		/**
		 * 获取状态
		 */
		public function get logicAngle() : uint
		{
			return _logicAngle;
		}

		override public function dispose() : void
		{
			//标识正在释放中
			_disposing = true;
			if (isMainChar)
			{
				if (_camouflageEntity is BaseRole && _camouflageEntity.usable)
				{
					(_camouflageEntity as BaseRole).isMainCamouflage = false;
				}
			}
			isMainChar = false;
			isMainCamouflage = false;
			ownerIsMainChar = false;
			super.dispose();
		}
	}
}
