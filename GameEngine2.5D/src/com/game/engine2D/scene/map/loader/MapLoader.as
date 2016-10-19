package  com.game.engine2D.scene.map.loader
{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.config.MapConfig;
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine2D.scene.map.vo.MapTile;
	
	import flash.display.Shape;
	import flash.events.Event;
	import flash.net.URLLoaderDataFormat;
	import flash.utils.ByteArray;
	
	import org.client.load.loader.multi.DobjLoadManager;
	import org.client.load.loader.multi.UrlLoadManager;
	import org.client.load.loader.multi.loader.UrlLoader;
	import org.client.load.loader.multi.vo.LoadData;
	
	/**
	 * @private
	 * 场景缩略地图层
	 * @author Carver
	 */
	public class MapLoader
	{
		public function MapLoader()
		{
			
		}
		/**
		 * @private
		 * 加载地图配置文件
		 * @param $mapID 场景ID
		 * @param $mapConfigUrl 配置xml的地址
		 * @param $smallMapUrl 小地图的地址
		 * @param $zoneMapUrl 区域地图图片地址
		 * @param $onComplete 完成回调$onComplete(mapConfig:MapConfig)
		 * @param $onUpdate 过程回调$onUpdate(e:ProgressEvent)
		 * 地图配置格式：
		 * 		横向格子数H(int),纵向格子数V(int),
		 * 		int(H*V/2)+H*V%2 条点数据:byte[s(2bit),m(2bit),s(2bit),m(2bit)]
		 * 解释：
		 * 		点排列规则：h0v0,h0v1,h0v2.....h1v0,h1v1,h1v2....
		 * 		点位置由读取位置确定， 点信息为s(2bit)和m(2bit)，所以一个点占用4bit,则每个byte包含两个点，如果点为奇数个则最后一个byte低4位补0
		 * 注意：此方式最多存储两个值，且每个值的方位为[0,3]
		 * 
		 */	
		public static function loadMapConfig(
			$mapID:int, 
			
			$mapConfigUrl:String,
			$smallMapUrl:String,
			$zoneMapUrl:String,
			
			$onComplete:Function=null,  
			$onUpdate:Function=null
		):void
		{
			//版本
			if(GlobalConfig2D.version!=null)
			{
				$mapConfigUrl = GlobalConfig2D.version($mapConfigUrl);
			}
			//开始新的加载(给一个最高的优先级)
			var loadData:LoadData = new LoadData($mapConfigUrl,newOnComplete,newOnUpdate,null,"","",int.MAX_VALUE,URLLoaderDataFormat.BINARY);
			UrlLoadManager.load(loadData);
			//地图配置加载完毕函数
			function newOnComplete($ld:LoadData,e:Event):void
			{
				loadMapConfigByBinary(
					$mapID,
					(e.target as UrlLoader).data,
					$smallMapUrl,
					$zoneMapUrl,
					$onComplete
				);
			}
			//地图配置加载过程函数
			function newOnUpdate($ld:LoadData,e:Event):void
			{
				if($onUpdate!=null)
				{
					$onUpdate(e);
				}
			}
						
		}
		/**
		 * @private
		 * 加载地图配置文件(通过ByteArry)
		 * @param $mapID 场景ID
		 * @param $mapConfigBinary 配置xml的二进制文件
		 * @param $smallMapUrl 小地图的地址
		 * @param $zoneMapUrl 区域地图图片地址
		 * @param $onComplete 完成回调$onComplete(mapConfig:MapConfig)
		 * 地图配置格式：
		 * 		横向格子数H(int),纵向格子数V(int),
		 * 		int(H*V/2)+H*V%2 条点数据:byte[s(2bit),m(2bit),s(2bit),m(2bit)]
		 * 解释：
		 * 		点排列规则：h0v0,h0v1,h0v2.....h1v0,h1v1,h1v2....
		 * 		点位置由读取位置确定， 点信息为s(2bit)和m(2bit)，所以一个点占用4bit,则每个byte包含两个点，如果点为奇数个则最后一个byte低4位补0
		 * 注意：此方式最多存储两个值，且每个值的方位为[0,3]
		 * 
		 */	
		public static function loadMapConfigByBinary(
			$mapID:int, 
			
			$mapConfigBinary:ByteArray, 
			$smallMapUrl:String,
			$zoneMapUrl:String,
			
			$onComplete:Function=null
		):void
		{
			//获取XML
			var obj:ByteArray = $mapConfigBinary;
			//解压解密
			if(GlobalConfig2D.decode!=null)
			{
//				obj = ZZip.extractFristBinaryFileContent(obj,GlobalConfig.decode);
				if(obj.length==0)return;
			}
			//				var content:XML = XML(obj);
			//				var xml:XML;
			
			//读取地图主配置
			var mapConfig:MapConfig = new MapConfig();
			mapConfig.mapID = $mapID;//注意这个
			mapConfig.gridH = obj.readInt();
			mapConfig.gridV =  obj.readInt();
			mapConfig.width = mapConfig.gridH * SceneConfig.TILE_WIDTH;
			mapConfig.height = mapConfig.gridV * SceneConfig.TILE_HEIGHT;
			mapConfig.smallMapUrl =  $smallMapUrl;
			mapConfig.zoneMapUrl = $zoneMapUrl;
//			mapConfig.mapGrid = new Grid(mapConfig.gridH,mapConfig.gridV);
			
			//读取地图逻辑格配置（包括障碍和透明度）
//			var mapTiles:Object = {};
//			var mapSolids:Object = {};
			var mapTiles:Vector.<Vector.<MapTile>> = new Vector.<Vector.<MapTile>>;
			var mapSolids:Vector.<Vector.<uint>> = new Vector.<Vector.<uint>>;
			//计算逻辑格数
			var totalGridCount:int = mapConfig.gridH*mapConfig.gridV;
			//计算byte数
			var byteCount:int = int(totalGridCount/2)+totalGridCount%2;
			var tow:Boolean = (totalGridCount%2==0);//是否是偶数个
			var x:int=0;
			var y:int=0;
			
//			var sp:Shape;//障碍点
			while(byteCount-->0)
			{
				var byte:int = obj.readByte();
				
				//获取高4位标识的点
				//掩码为0xc0   对应二进制为11000000
				var s : int = (byte & 0xc0) >> 6;
				//掩码为0x30   对应二进制为00110000
				var m : int = (byte & 0x30) >> 4;
				//赋值
//				mapTiles[x+"_"+y] = new MapTile(x,y,s==1,s==2,m==1);
//				mapSolids[x+"_"+y] = s==1?1:0;
				
				if(mapTiles.length > x && mapTiles[x])
				{
				}
				else
				{
					mapTiles[x] = new Vector.<MapTile>;
				}
				//
				if(mapSolids.length > x && mapSolids[x])
				{
				}
				else
				{
					mapSolids[x] = new Vector.<uint>;
				}
				
				mapTiles[x][y] = new MapTile(x,y,s==1,s==2,m==1);
				mapSolids[x][y] = s==1?1:0;
//				mapConfig.mapGrid.setWalkable(x,y,s==1?false:true);
//				if(s == 1)
//				{
//					sp = getRect(25,25,0xff0000,0.2);
//					sp.x = x*25;
//					sp.y = y*25;
//					Scene.scene.customLowLayer.addChild(sp);	
//				}
				
				//自增
				if(y==mapConfig.gridV-1)
				{
					x++;
					y = 0;
				}
				else
				{
					y++;
				}
				
				
				//获取低4位标识的点
				if(tow || byteCount>=1)
				{
					//掩码为0xc   对应二进制为00001100
					s = (byte & 0xc) >> 2;
					//掩码为0x3   对应二进制为00000011
					m = (byte & 0x3);
					//赋值
//					mapTiles[x+"_"+y] = new MapTile(x,y,s==1,s==2,m==1);
//					mapSolids[x+"_"+y] = s==1?1:0;
					
					
					if(mapTiles.length > x && mapTiles[x])
					{
					}
					else
					{
						mapTiles[x] = new Vector.<MapTile>;
					}
					//
					if(mapSolids.length > x && mapSolids[x])
					{
					}
					else
					{
						mapSolids[x] = new Vector.<uint>;
					}
					
					mapTiles[x][y] = new MapTile(x,y,s==1,s==2,m==1);
					mapSolids[x][y] = s==1?1:0;
//					if(s == 1)
//					{
//						sp = getRect(25,25,0xff0000,0.2);
//						sp.x = x*25;
//						sp.y = y*25;
//						Scene.scene.customLowLayer.addChild(sp);
//					}
					
					//自增
					if(y==mapConfig.gridV-1)
					{
						x++;
						y = 0;
					}
					else
					{
						y++;
					}
				}
			}
			mapConfig.mapTiles = mapTiles;
			mapConfig.mapSolids = mapSolids;
			//执行回调
			if($onComplete!=null)
			{
				$onComplete(mapConfig);
			}							
		}
		
		private static function getRect(width:Number,height:Number,color:uint = 0xff0000,alpha:uint = 1):Shape
		{
			var sp:Shape = new Shape();
			sp.graphics.beginFill(color,1);
			sp.graphics.drawRect(0,0,width,height);
			sp.graphics.endFill();
			return sp;
		}
		
		/**
		 * @private
		 * 加载小地图
		 * @param $smallMapUrl
		 * @param $onSmallMapComplete 小地图完成回调$onComplete(e:Event)
		 * @param $onSmallMapUpdate 小地图过程回调$onUpdate(e:ProgressEvent)
		 */	
		public static function loadSmallMap($smallMapUrl:String,$onSmallMapComplete:Function=null,$onSmallMapUpdate:Function=null):void
		{
			if($smallMapUrl == null)
			{
				return;
			}
//			//版本 11111临时注掉，加这个参数会影响未加载完成时的取消加载
//			if(GlobalConfig.version!=null)
//			{
//				$smallMapUrl = GlobalConfig.version($smallMapUrl);
//			}
			//加载(给一个最高的优先级)
			var ld:LoadData = new LoadData($smallMapUrl,newOnSmallMapComplete,newOnSmallMapUpdate,null,"","",int.MAX_VALUE,LoadData.LOADER_DISPLAYOBJECT,GlobalConfig2D.decode);
			DobjLoadManager.load(ld);
			//小地图加载完毕函数
			function newOnSmallMapComplete(ld:LoadData, e:Event):void
			{			 
				//var bm:Bitmap = (e.target as DobjLoader).content as Bitmap;
				//加载缩略图完毕回调
				if($onSmallMapComplete!=null)
				{
					$onSmallMapComplete(e);
				}
			}
			//地图配置加载过程函数
			function newOnSmallMapUpdate($ld:LoadData,e:Event):void
			{
				if($onSmallMapUpdate!=null)
				{
					$onSmallMapUpdate(e);
				}
			}
		}
		
	}
}