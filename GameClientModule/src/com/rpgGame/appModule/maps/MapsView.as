package com.rpgGame.appModule.maps
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.maps.maps_Skin;
	import org.mokylin.skin.component.text.textInput2_Skin;
	
	import starling.display.DisplayObject;

	/**
	 *大地图显示类，里面包含所有显示对象 
	 * @author YT
	 * 
	 */	
	public class MapsView  extends SkinUIPanel
	{
		protected var _skin :maps_Skin;
		protected var _bigMap :BigMaps;
		protected var _scoll:BigMapScroll;
		
		public function MapsView()
		{
			this._skin=new maps_Skin();
			super(_skin);
			initMaps();
			initScroll();
		}
		/**初始化大地图*/
		private function initMaps() : void 
		{
			_bigMap = new BigMaps(_skin);
			_bigMap.init();
			
			//_skin.tab.
			
		}
		
		/**初始化右边信息框*/
		private function initScroll() : void 
		{
			_skin.Item1.visible=false;
			_skin.Item2.visible=false;
			_skin.Item3.visible=false;
			_scoll=new BigMapScroll(_skin.scroll_Bar);
			_scoll.init();
			
			
		}
		
		
		/**处理选择到的列表里面的元素*/
		protected function roleSelect(target:DisplayObject):void
		{
			if(target.name==null||target.name=="")//通过点击元素的名字找是否点击到了 列表里面的元素
			{
				return;
			}
			
			var name:String=target.name;
			var nameSplit:Array=name.split("_");
			//分解名字字符，0 标记  1 类型  2 位置ID
			if(nameSplit.length==3&&nameSplit[0]=="ROLE")
			{
				var i:int,length:int,id:int;
				var releData:BigMapIocnDataMode;
				id=int(nameSplit[2]);
				if(nameSplit[1]=="3")
				{
					if(id<BigMapsData.mapsNpcData.length)
					{
						releData=BigMapsData.mapsNpcData[id];
					}
					
					
				}
				else if(nameSplit[1]=="2")
				{
					if(id<BigMapsData.mapsMonsterData.length)
					{
						releData=BigMapsData.mapsMonsterData[id];
					}
				}
				else if(nameSplit[1]=="6")
				{
					if(id<BigMapsData.mapsThansData.length)
					{
						releData=BigMapsData.mapsThansData[id];
					}
				}
				if(releData)
				{
					_bigMap.roleWalk(releData.x,releData.y);
				}
			}
			else if(name==_skin.btn_go.name)
			{
				var wx:Number=Number(textInput2_Skin(_skin.locat_x.skin).textDisplay.text);
				var wy:Number=-Number(textInput2_Skin(_skin.locat_y.skin).textDisplay.text);
				if(wx&&wy)
				{
					_bigMap.roleWalk(wx,wy);
				}
				
			}
			
		}
		
		protected function changeTab() : void 
		{
			_skin.tab.selectedIndex=1;
		}
		
		
		
		/**清除面板上的显示*/
		protected function clearMapsView() : void 
		{
			this._skin.lbl_mapName.text="";
			textInput2_Skin(_skin.locat_x.skin).textDisplay.text="";
			textInput2_Skin(_skin.locat_y.skin).textDisplay.text="";
			_bigMap.clearView();
			_scoll.clearItem();
		}
		/**大地图加载*/
		protected function loadBigMapView(sceneId:int):void
		{
			_bigMap.loadMap(sceneId);
		
		}
		/**右边信息框生成*/
		protected function scollBoxView():void
		{
			_scoll.boxView();
			
		}
		/**右边坐标信息*/
		protected function siteView():void
		{
			var player : SceneRole = MainRoleManager.actor;
			if (player)
			{
				textInput2_Skin(_skin.locat_x.skin).textDisplay.text=""+int(player.position.x);
				textInput2_Skin(_skin.locat_y.skin).textDisplay.text=""+int(-player.position.z);
				
			}
			
		}
		
		/**设置地图名称*/
		protected function setMapName(name:String):void
		{
			L.l("name"+name);
			this._skin.lbl_mapName.text=name;
		}
		
		
		
		
		
	}
}