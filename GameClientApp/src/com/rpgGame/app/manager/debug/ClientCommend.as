package   com.rpgGame.app.manager.debug
{	
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.utils.StatsUtil;
	import com.game.mainCore.core.manager.LayerManager;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.fight.spell.SpellHitHelper;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.PKMamager;
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	import com.rpgGame.app.manager.role.MainRoleManager;
	
	import org.client.mainCore.ds.HashMap;
	import org.game.netCore.net.MessageMgr;

	
	/**
	 * 客户端命令
	 * @author ty
	 */
	public class ClientCommend
	{
		private static var ins:ClientCommend=new ClientCommend();
		private static var _isDevelop:Boolean;
		public function ClientCommend():void
		{
			initCommend();
			_isDevelop=MessageMgr.Ins.ip.indexOf("192.168")!=-1
		}
		
		private  var commandList:com.gameClient.utils.HashMap = new com.gameClient.utils.HashMap();
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
			commandList.put( ".vip", function (...arg):void
			{
				Mgr.vipMgr.vipLv=arg[0];
			});
			commandList.put( ".pk", function (...arg):void
			{
				MainRoleManager.actorInfo.pkMode=arg[0];
				PKMamager.setPkMode(arg[0]);
				
			});
			commandList.put( ".fight", function (...arg):void
			{
				
				SpellHitHelper.bool=!SpellHitHelper.bool;
			});
			commandList.put( ".attr", function (...arg):void
			{
				
				var hash:org.client.mainCore.ds.HashMap=new org.client.mainCore.ds.HashMap();
				hash.add(1,1000);
				hash.add(2,2000);
				hash.add(3,-1000);
				hash.add(4,-2023);
				hash.add(10,1333);
				hash.add(15,14444);
				hash.add(16,-302222);
				FightFaceHelper.showPlayerBaseAttrChange(hash);
			});
		}
		
		
		public static function doCommand(str:String):Boolean 
		{
			if (!_isDevelop) 
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
