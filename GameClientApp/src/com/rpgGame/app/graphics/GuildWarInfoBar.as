package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.rpgGame.app.scene.SceneRole;
	
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.app.banghui.huangcheng.Head_Info;
	
	import starling.display.Sprite;
	
	/**
	 *帮会战信息条 
	 * @author dik
	 * 
	 */
	public class GuildWarInfoBar extends Sprite implements IInstancePoolClass
	{
		private static var barPool : InstancePool = new InstancePool("GuildWarInfoBar", 300);
		public static function create($role : SceneRole) : GuildWarInfoBar
		{
			var bar:GuildWarInfoBar=barPool.createObj(GuildWarInfoBar, $role) as GuildWarInfoBar;
			return bar;
		}
		
		public static function recycle(bar : GuildWarInfoBar) : void
		{
			barPool.recycleObj(bar);
		}
		
		private var _skin:StateSkin;
		private var _role:SceneRole;
		private var _isDestroyed:Boolean;
		private var _isDisposed:Boolean;
		public function GuildWarInfoBar($role : SceneRole)
		{
			super();
			_role = $role;
			_isDestroyed = false;
			_skin=new Head_Info();
			_skin.toSprite(this);
			reSet(null);
		}
		
		public function putInPool():void
		{
			if (parent != null)
				parent.removeChild(this);
			_role=null;
			_isDisposed = true;
		}
		
		public function instanceDestroy():void
		{
			putInPool();
			dispose();
			_isDestroyed = true;
			_role=null;
		}
		
		public function reSet(parameters:Array):void
		{
			_isDisposed = false;
			_isDestroyed=false;
		}
		
		public function get isInPool():Boolean
		{
			return _isDisposed;
		}
		
		public function get isDestroyed():Boolean
		{
			return _isDestroyed;
		}
	}
}