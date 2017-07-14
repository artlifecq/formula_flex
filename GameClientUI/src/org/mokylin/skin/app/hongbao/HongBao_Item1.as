package org.mokylin.skin.app.hongbao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.hongbao.HongBao_ItemBg;
	
	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HongBao_Item1 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;
		
		public var lbName:feathers.controls.Label;
		
		public var lbNum:feathers.controls.Label;
		
		public var lbmsg:feathers.controls.Label;
		
		
		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HongBao_Item1()
		{
			super();
			
			this.currentState = "normal";
			this.height = 31;
			this.width = 263;
			this.elementsContent = [bg_i(),lbNum_i(),lbName_i(),lbmsg_i()];
			
			states = {
			};
			skinNames={};
		}
		
		
		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 31;
			var skin:StateSkin = new org.mokylin.skin.app.hongbao.HongBao_ItemBg()
			temp.skin = skin
			temp.width = 263;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}
		
		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "超级无敌xxxx";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 108;
			temp.x = 154;
			temp.y = 7;
			return temp;
		}
		
		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "20礼金";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 57;
			temp.x = 14;
			temp.y = 7;
			return temp;
		}
		
		private function lbmsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbmsg = temp;
			temp.name = "lbmsg";
			temp.text = "来自土豪";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 66;
			temp.x = 77;
			temp.y = 7;
			return temp;
		}
		
	}
}