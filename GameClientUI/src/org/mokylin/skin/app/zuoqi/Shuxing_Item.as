package org.mokylin.skin.app.zuoqi
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	
	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Shuxing_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ico_up:feathers.controls.UIAsset;
		
		public var lbCurrent:feathers.controls.Label;
		
		public var lbName:feathers.controls.Label;
		
		public var lbUp:feathers.controls.Label;
		
		public var lbaddprop:feathers.controls.Label;
		
		
		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Shuxing_Item()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [lbName_i(),lbCurrent_i(),lbaddprop_i(),lbUp_i(),ico_up_i()];
			
			states = {
			};
			skinNames={};
		}
		
		
		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function ico_up_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_up = temp;
			temp.name = "ico_up";
			temp.styleName = "ui/common/tubiao/tu_up.png";
			temp.x = 204;
			temp.y = 3;
			return temp;
		}
		
		private function lbCurrent_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCurrent = temp;
			temp.name = "lbCurrent";
			temp.text = "100";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 62;
			temp.y = 1;
			return temp;
		}
		
		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "力    道：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}
		
		private function lbUp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbUp = temp;
			temp.name = "lbUp";
			temp.text = "+20";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 178;
			temp.y = 2;
			return temp;
		}
		
		private function lbaddprop_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbaddprop = temp;
			temp.name = "lbaddprop";
			temp.text = "100";
			temp.color = 0x25931B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 94;
			temp.y = 1;
			return temp;
		}
		
	}
}