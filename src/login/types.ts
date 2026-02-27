import { TemplateProps } from "keycloakify/login/TemplateProps";
import { I18n } from "./i18n";
import { KcContext } from "./KcContext";

type CustomTemplateProps<T> = Omit<
  TemplateProps<Extract<KcContext, { pageId: T }>, I18n>,
  "doUseDefaultCss" | "headerNode"
>;

type PageProps<T> = {
  kcContext: Extract<KcContext, { pageId: T }>;
  i18n: I18n;
  Template: (props: CustomTemplateProps<T>) => JSX.Element;
};

export type { PageProps, CustomTemplateProps };
