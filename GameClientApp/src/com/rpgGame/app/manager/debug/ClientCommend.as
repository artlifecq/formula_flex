package   com.rpgGame.app.manager.debug
{	
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.utils.StatsUtil;
	import com.game.mainCore.core.manager.LayerManager;
	import com.gameClient.utils.HashMap;
	
	import org.game.netCore.net.MessageMgr;

	
	/**
	 * 客户端命令
	 * @author ty
	 */
	public class ClientCommend
	{
		private static var ins:ClientCommend=new ClientCommend();
		public function ClientCommend():void
		{
			initCommend();
		}
		public static function isDevelop():Boolean
		{
			return MessageMgr.Ins.ip.indexOf("192.168")!=-1;
		}
		private  var commandList:HashMap = new HashMap();
		private  var docommandList:Vector.<String> = new Vector.<String>;
		

		public  function initCommend():void 
		{
			commandList.put( ".hidestate", function (...arg):void
			{
				LayerManager.showOrHideMM();
				StatsUtil.hideAwayStats();
				
			});
			commandList.put( ".showstate", function (...arg):void
			{
				LayerManager.showOrHideMM();
				StatsUtil.showAwayStats(Stage3DLayerManager.stage,Stage3DLayerManager.stage3DProxy);
			});
		}
		
		
		public static function doCommand(str:String):Boolean 
		{
			if (!isDevelop()) 
			{
				return false;
			}
			str=str.toLowerCase();
			if (str == null || str.length <2)
				return false;
			
			if (str.charAt(0) == '。')
				str = str.replace('。', '.');
			
			if (str.charAt(0) != '.')
				return false;
			
			var boadd2list:Boolean=true;
			var i:int;
			if (str.charAt(1) == '-')
			{
				boadd2list=false;
				str=str.substr(1);
				i=parseInt(str);
				if(i==0)i=-1;
				i=ins.docommandList.length+i;
				if( i>=0 && i<ins.docommandList.length )
				{
					//Mgr.mainBottomMgr.mainBottomPanel.editInput.text = docommandList[i];
					str=ins.docommandList[i];
				}else{
					return false;
				}
			}
			
			var cmdArray:Array = str.split(" ");
			var param:Array = [];
			for ( i = 0; i < 10; i++)
			{
				param[i] = (cmdArray.length > (i + 1)) ? cmdArray[i + 1] : "";
			}
			
			var func:Function = ins.commandList.get(cmdArray[0]) as Function;
			if (func != null) {
				//				if(boadd2list){
				//					if( docommandList.indexOf(str)<0 && (cmdArray[0]!=".sscmd") && (cmdArray[0]!=".clearc") ){
				//						docommandList.push(str);
				//						Mgr.cache.data["docommandList"]=docommandList;
				//						Mgr.flushCache();
				//					}
				//				}
				func(param[0], param[1], param[2], param[3], param[4], param[5], param[6], param[7], param[8], param[9]);
				return true;
			}
			
			return false;
		}
	}
}
