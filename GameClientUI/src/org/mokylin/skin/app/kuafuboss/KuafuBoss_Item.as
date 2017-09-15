package org.mokylin.skin.app.kuafuboss
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.kuafuboss.number.UINumberBossLevel;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class KuafuBoss_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var lbTime:feathers.controls.Label;

		public var numLevel:feathers.controls.UINumber;

		public var uiJi:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;

		public var uiSelect:feathers.controls.UIAsset;

		public var uiTips:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function KuafuBoss_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 86;
			this.width = 254;
			this.elementsContent = [bg_i(),uiName_i(),__KuafuBoss_Item_Label1_i(),lbTime_i(),numLevel_i(),uiJi_i(),uiSelect_i(),uiTips_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __KuafuBoss_Item_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "剩余刷新时间：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 135;
			temp.y = 44;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/app/kuafuboss/boss/baiqiyinghun.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "02:05:16";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 88;
			temp.x = 138;
			temp.y = 60;
			return temp;
		}

		private function numLevel_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numLevel = temp;
			temp.name = "numLevel";
			temp.gap = -2;
			temp.height = 25;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.label = "70";
			temp.styleClass = org.mokylin.skin.app.kuafuboss.number.UINumberBossLevel;
			temp.width = 50;
			temp.x = 204;
			temp.y = 18;
			return temp;
		}

		private function uiJi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJi = temp;
			temp.name = "uiJi";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/kuafuboss/ji.png";
			temp.x = 224;
			temp.y = 18;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/kuafuboss/name/baiqiyinghun.png";
			temp.x = 96;
			temp.y = 11;
			return temp;
		}

		private function uiSelect_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiSelect = temp;
			temp.name = "uiSelect";
			temp.styleName = "ui/app/kuafuboss/xuanzhong.png";
			temp.x = 9;
			temp.y = 4;
			return temp;
		}

		private function uiTips_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiTips = temp;
			temp.name = "uiTips";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/yijisha3.png";
			temp.x = 66;
			temp.y = 39;
			return temp;
		}

	}
}