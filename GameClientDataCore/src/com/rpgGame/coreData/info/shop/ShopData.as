package com.rpgGame.coreData.info.shop
{
	import app.message.ShopProto;

	public class ShopData
	{
		/**商店ID**/
		public var id:int;
		/**商店名字**/
		public var name:String;
		/**标签页列表**/
		public var tabVect:Vector.<ShopTabData>;
		
		public function ShopData()
		{
			tabVect = new Vector.<ShopTabData>();
		}
		
		public function setData( shopProto:ShopProto ):void
		{
			if( shopProto == null )
				return;
			
			id = shopProto.id;
			if( shopProto.name != null )
				name = shopProto.name.toString();
			
			var tabData:ShopTabData;
			var len:int = shopProto.tabList.length;
			for( var i:int = 0 ;i < len; i ++ )
			{
				tabData = new ShopTabData();
				tabData.setData( shopProto.tabList[i], id );
				tabVect.push( tabData );
			}
		}
	}
}