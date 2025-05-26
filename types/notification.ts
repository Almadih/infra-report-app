export interface Notification {
  id: string;
  read_at: null | string;
  created_at: string;
  data: {
    title: string;
    body: string;
    data: StringValueObject;
  };
}

type StringValueObject = {
  [key: string]: string;
};
