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
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;

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
		public var ListMap:feathers.controls.List;

		public var NumZhanli:feathers.controls.UINumber;

		public var bossItemRongQi:feathers.controls.SkinnableContainer;

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
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__ZhanGong_Skin_UIAsset2_i(),__ZhanGong_Skin_UIAsset3_i(),__ZhanGong_Skin_UIAsset4_i(),grp_zhandouli_i(),lb_shuxing_i(),ListMap_i(),bossItemRongQi_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function ListMap_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			ListMap = temp;
			temp.name = "ListMap";
			temp.height = 400;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 238;
			temp.x = 27;
			temp.y = 133;
			return temp;
		}

		private function NumZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			NumZhanli = temp;
			temp.name = "NumZhanli";
			temp.gap = -6;
			temp.height = 25;
			temp.label = "629845";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;
			temp.width = 142;
			temp.x = 56;
			temp.y = 3;
			return temp;
		}

		private function __ZhanGong_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 409;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 246;
			temp.x = 23;
			temp.y = 128;
			return temp;
		}

		private function __ZhanGong_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 409;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 666;
			temp.x = 268;
			temp.y = 128;
			return temp;
		}

		private function __ZhanGong_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/zhangong/banner.jpg";
			temp.x = 23;
			temp.y = 87;
			return temp;
		}

		private function bossItemRongQi_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bossItemRongQi = temp;
			temp.name = "bossItemRongQi";
			temp.height = 405;
			temp.width = 662;
			temp.x = 270;
			temp.y = 130;
			return temp;
		}

		private function grp_zhandouli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhandouli = temp;
			temp.name = "grp_zhandouli";
			temp.x = 29;
			temp.y = 95;
			temp.elementsContent = [ui_zhandou_i(),NumZhanli_i()];
			return temp;
		}

		private function lb_shuxing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_shuxing = temp;
			temp.name = "lb_shuxing";
			temp.leading = 0;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "属性总加成";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 839;
			temp.y = 107;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/common/zhandouli2.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}