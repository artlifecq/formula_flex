package org.mokylin.skin.common.alert
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;
	
	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class AlertOKCancel extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;
		
		public var btnCancel:feathers.controls.Button;
		
		public var btnClose:feathers.controls.Button;
		
		public var btnOk:feathers.controls.Button;
		
		public var cboxTip:feathers.controls.Check;
		
		public var lbTip:feathers.controls.Label;
		
		
		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function AlertOKCancel()
		{
			super();
			
			this.currentState = "normal";
			this.height = 264;
			this.width = 326;
			this.elementsContent = [bg_i(),btnClose_i(),btnOk_i(),btnCancel_i(),lbTip_i(),__AlertOKCancel_UIAsset1_i(),cboxTip_i()];
			
			states = {
			};
			skinNames={};
		}
		
		
		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __AlertOKCancel_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/background/wxts.png";
			temp.x = 121;
			temp.y = 9;
			return temp;
		}
		
		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 264;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.width = 326;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}
		
		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "取 消";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.width = 88;
			temp.x = 181;
			temp.y = 216;
			return temp;
		}
		
		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 297;
			temp.y = 7;
			return temp;
		}
		
		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "确 定";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.width = 88;
			temp.x = 57;
			temp.y = 216;
			return temp;
		}
		
		private function cboxTip_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			cboxTip = temp;
			temp.name = "cboxTip";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 24;
			temp.label = "下次不再提示";
			temp.labelOffsetY = 3;
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.textAlign = "left";
			temp.color = 0x00FF33;
			temp.width = 202;
			temp.x = 95;
			temp.y = 174;
			return temp;
		}
		
		private function lbTip_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTip = temp;
			temp.name = "lbTip";
			temp.height = 124;
			temp.leading = 2;
			temp.letterSpacing = 0;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 293;
			temp.x = 16;
			temp.y = 46;
			return temp;
		}
		
	}
}