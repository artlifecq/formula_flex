package  com.rpgGame.app.ui.main.openActivity.comps
{
    import com.game.activities.business.ActivityVo;

    public interface ICampSub
    {
        function setData(infos:Vector.<ActivityVo>):void;
        
        function dispose():void;
        
        function set x(value:Number):void;
        
        function set y(value:Number):void;
		
		function get width():Number;
		
		function get height():Number;
		
		function update():void;
		
		function onShow():void;
		
		function onHide():void;
    }
}