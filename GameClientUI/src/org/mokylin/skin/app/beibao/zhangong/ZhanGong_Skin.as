package org.mokylin.skin.app.beibao.zhangong
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.list.ListSkin1;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZhanGong_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ListBoss:feathers.controls.List;

		public var ListMap:feathers.controls.List;

		public var Num_zhandouli:feathers.controls.UINumber;

		public var grp_zhandouli:feathers.controls.Group;

		public var lb_shuxing:feathers.controls.Label;

		public var ui_zhandou:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZhanGong_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__ZhanGong_Skin_UIAsset1_i(),__ZhanGong_Skin_UIAsset2_i(),__ZhanGong_Skin_UIAsset3_i(),grp_zhandouli_i(),lb_shuxing_i(),ListMap_i(),ListBoss_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function ListBoss_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			ListBoss = temp;
			temp.name = "ListBoss";
			temp.height = 386;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 657;
			temp.x = 270;
			temp.y = 133;
			return temp;
		}

		private function ListMap_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			ListMap = temp;
			temp.name = "ListMap";
			temp.height = 386;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 238;
			temp.x = 24;
			temp.y = 133;
			return temp;
		}

		private function Num_zhandouli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			Num_zhandouli = temp;
			temp.name = "Num_zhandouli";
			temp.gap = -3;
			temp.height = 25;
			temp.label = "652147";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;
			temp.width = 147;
			temp.x = 53;
			temp.y = 9;
			return temp;
		}

		private function __ZhanGong_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 396;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 250;
			temp.x = 17;
			temp.y = 127;
			return temp;
		}

		private function __ZhanGong_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 396;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 666;
			temp.x = 266;
			temp.y = 127;
			return temp;
		}

		private function __ZhanGong_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/zhangong/banner.jpg";
			temp.x = 20;
			temp.y = 76;
			return temp;
		}

		private function __ZhanGong_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/di.png";
			temp.x = 22;
			temp.y = 0;
			return temp;
		}

		private function grp_zhandouli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhandouli = temp;
			temp.name = "grp_zhandouli";
			temp.x = 46;
			temp.y = 81;
			temp.elementsContent = [__ZhanGong_Skin_UIAsset4_i(),ui_zhandou_i(),Num_zhandouli_i()];
			return temp;
		}

		private function lb_shuxing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_shuxing = temp;
			temp.name = "lb_shuxing";
			temp.leading = 0;
			temp.letterSpacing = 0;
			temp.fontSize = 12;
			temp.text = "属性总加成";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 838;
			temp.y = 95;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/common/zhandouli2.png";
			temp.x = 0;
			temp.y = 10;
			return temp;
		}

	}
}