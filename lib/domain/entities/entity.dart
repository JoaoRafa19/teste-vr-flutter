class Entity {
  bool isValid;

  Entity() : isValid = true;

  Entity.invalid()
      : isValid = false,
        super();
  Entity get validate => this..isValid = true;
}
