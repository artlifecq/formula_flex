package org.mokylin.skin.app.zhanchang.jingjichang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RoleItem extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgCon:feathers.controls.UIAsset;

		public var lbLevel:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var numZhanli:feathers.controls.UINumber;

		public var uiGuan:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RoleItem()
		{
			super();
			
			this.currentState = "normal";
			this.width = 176;
			this.elementsContent = [__RoleItem_UIAsset1_i(),imgCon_i(),uiGuan_i(),lbLevel_i(),lbName_i(),numZhanli_i(),__RoleItem_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RoleItem_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jingjichang/dizuo.png";
			temp.x = 0;
			temp.y = 305;
			return temp;
		}

		private function __RoleItem_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/zhandouli.png";
			temp.x = 24;
			temp.y = 358;
			return temp;
		}

		private function imgCon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgCon = temp;
			temp.name = "imgCon";
			temp.height = 316;
			temp.width = 150;
			temp.x = 12;
			temp.y = 0;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.fontSize = 16;
			temp.text = "第1名";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 72;
			temp.x = 65;
			temp.y = 318;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 14;
			temp.text = "军安卫士";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 100;
			temp.x = 46;
			temp.y = 337;
			return temp;
		}

		private function numZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numZhanli = temp;
			temp.name = "numZhanli";
			temp.gap = -1;
			temp.height = 25;
			temp.label = "65214";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;
			temp.width = 89;
			temp.x = 78;
			temp.y = 358;
			return temp;
		}

		private function uiGuan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiGuan = temp;
			temp.name = "uiGuan";
			temp.styleName = "ui/app/zhanchang/jingjichang/1.png";
			temp.x = 44;
			temp.y = 315;
			return temp;
		}

	}
}