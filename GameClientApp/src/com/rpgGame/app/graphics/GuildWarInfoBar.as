package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.netData.structs.IntKeyValue;
	
	import feathers.controls.StateSkin;
	
	import org.client.mainCore.ds.HashMap;
	import org.mokylin.skin.app.banghui.huangcheng.HeadInfoItem;
	import org.mokylin.skin.app.banghui.huangcheng.Head_Info;
	import org.mokylin.skin.app.banghui.huangcheng.Head_Info2;
	
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
		
		private var weiczbItems:Array=[5088,5089,5090];
		private var wangczbItems:Array=[5091,5092,5095];
		private var huangczbItems:Array=[5093,5094,5096];
		private var maps:Array=[900,901,902];
		private var items:Array;
		private var dataMap:HashMap=new HashMap();
		
		public function GuildWarInfoBar($role : SceneRole)
		{
			super();
			_role = $role;
			_isDestroyed = false;
			var mapId:int=MainRoleManager.actorInfo.mapID;
			switch(mapId){
				case maps[0]:
					_skin=new Head_Info();
					setItemRes(_skin["skin1"].skin as HeadInfoItem,"tong");
					setItemRes(_skin["skin2"].skin as HeadInfoItem,"yin");
					setItemRes(_skin["skin3"].skin as HeadInfoItem,"jin");
					items=weiczbItems;
					break;
				case maps[1]:
					_skin=new Head_Info2();
					setItemRes(_skin["skin1"].skin as HeadInfoItem,"kuang");
					setItemRes(_skin["skin2"].skin as HeadInfoItem,"zuan");
					items=wangczbItems;
					break;
				case maps[1]:
					_skin=new Head_Info2();
					setItemRes(_skin["skin1"].skin as HeadInfoItem,"kuang");
					setItemRes(_skin["skin2"].skin as HeadInfoItem,"zuan");
					items=huangczbItems;
					break;
			}
			_skin.toSprite(this);
			
			
			reSet(null);
		}
		
		private function setItemRes(skin:HeadInfoItem,res:String):void
		{
			skin.icon.styleName="ui/common/icon/caiji/"+res+"_24.png"
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
		
		public function update(oreList:Vector.<IntKeyValue>):void
		{
			//key是物品id，value是数量
			for(var i:int=0;i<oreList.length;i++){
				dataMap.add(oreList[i].key,oreList[i].value);
			}
			
			for(i=0;i<items.length;i++){
				var key:String=i+1+"";
				setItemNum(_skin["skin"+key].skin as HeadInfoItem,items[i]);
			}
		}
		
		private function setItemNum(item:HeadInfoItem,id:int):void
		{
			var num:int=dataMap.getValue(id)
			item.lbNum.text=num.toString();
		}
	}
}