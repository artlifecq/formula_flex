package  com.rpgGame.app.ui.main.openActivity.comps
{
    import com.rpgGame.coreData.info.openActivity.ActivityVo;

    public interface ICampSub
    {
        function setData(infos:Vector.<ActivityVo>):void;
          
        function set x(value:Number):void;
        
        function set y(value:Number):void;
		
		function get width():Number;
		
		function get height():Number;

		
    }
}