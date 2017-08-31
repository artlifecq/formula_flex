package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_vertex_color;
	
	import flash.utils.ByteArray;
	
	import feathers.themes.GuiTheme;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *49美术字填色表.xlsx
	 * @author dik
	 * 2017
	 */
	public class QVertexColorCfgData
	{
		private static var _idMap:HashMap;
		private static var _urlMap:HashMap;
		
		public function QVertexColorCfgData()
		{
		}
		
		public static function setup(data : ByteArray) : void 
		{
			_idMap=new HashMap();
			_urlMap=new HashMap();
			var arr : Array = data.readObject();
			for each(var info :Q_vertex_color in arr){
				for(var i:int=0;i<4;i++){
					if(!info["q_color"+i]){
						info["q_color"+i]="0xffffff";
					}else{
						info["q_color"+i]="0x"+info["q_color"+i];
					}
				}
			
				_idMap.add(info.q_id,info);
				if(info.q_url.charAt(info.q_url.length-1)!="/"&&_urlMap.getValue(info.q_url)==null){	//不是文件夹	,且没存过
					_urlMap.add(info.q_url,info);
				}
				if(info.q_type==1){
					var vs:Array=[];
					for(i=0;i<4;i++){
						vs.push(uint(info["q_color"+i]));
					}
					GuiTheme.ins.addUINumberColor(info.q_url,vs);
				}
			}
		}
		
		/**
		 *根据填色id获取填色配置 
		 * @param id
		 * @return 
		 * 
		 */
		public static function getVertexColorCfgById(id:int):Q_vertex_color
		{
			return _idMap.getValue(id);
		}
		
		/**
		 *根据地质获取填色配置 
		 * @param url
		 * @return 
		 * 
		 */
		public static function getVertexColorCfgByUrl(url:String):Q_vertex_color
		{
			return _urlMap.getValue(url);
		}
	}
}